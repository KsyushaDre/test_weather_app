import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test_weather_app/app_theme/extensions/context_extension.dart';
import 'package:test_weather_app/domain/domain_models/weather_data.dart';
import 'package:test_weather_app/presentation/main_screen_cubit.dart';
import 'package:test_weather_app/presentation/main_screen_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MainScreenCubit>().getWeatherData();
    });
  }

  Widget chooseCityWidget = const ChooseCity();
  Widget currentInfoWidget = const CurrentInfo();
  Widget todayInfoWidget = const TodayInfo();
  Widget forecastInfoListWidget = const ForecastInfoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<MainScreenCubit, MainScreenState>(
          builder: (context, state) {
            print('BUILD main widget');
            if (!state.isLoading) {
              return OrientationBuilder(
                builder: (context, orientation) {
                  print('ORIENTATION BUILDER, orientation: $orientation');
                  switch (orientation) {
                    case Orientation.portrait:
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          chooseCityWidget,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: currentInfoWidget,
                              ),
                              Flexible(
                                flex: 1,
                                child: todayInfoWidget,
                              ),
                            ],
                          ),
                          Builder(
                            builder: (context) {
                              double height = MediaQuery.of(context).size.height * 0.2;
                              return SizedBox(
                                height: height,
                                child: forecastInfoListWidget,
                              );
                            },
                          ),
                        ],
                      );
                    case Orientation.landscape:
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          chooseCityWidget,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: currentInfoWidget,
                              ),
                              Flexible(
                                flex: 1,
                                child: todayInfoWidget,
                              ),
                            ],
                          ),
                          Builder(
                            builder: (context) {
                              double width = MediaQuery.of(context).size.width * 0.4;
                              return SizedBox(
                                width: width,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 55.0),
                                  child: forecastInfoListWidget,
                                ),
                              );
                            },
                          ),
                        ],
                      );
                  }
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class CurrentInfo extends StatelessWidget {
  const CurrentInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('BUILD current info');
    return Column(
      children: [
        BlocBuilder<MainScreenCubit, MainScreenState>(builder: (context, state) {
          return Text(
            state.currentWeatherData!.locationName,
            style: context.currentLocationName,
          );
        }),
        InfoCard(
          backgroundColor: context.infoNowCardColor,
          child: const CurrentData(),
        ),
      ],
    );
  }
}

class TodayInfo extends StatelessWidget {
  const TodayInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('BUILD today info');
    return BlocBuilder<MainScreenCubit, MainScreenState>(
      builder: (context, state) {
        return ForecastInfoCard(dayForecastData: state.todayData!);
      },
    );
  }
}

class ForecastInfoList extends StatelessWidget {
  const ForecastInfoList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPortraitOrientation = MediaQuery.of(context).orientation == Orientation.portrait;

    print('BUILD forecast info list');
    return BlocBuilder<MainScreenCubit, MainScreenState>(
      builder: (context, state) {
        return ListView.separated(
          itemCount: state.forecastData!.length,
          scrollDirection: isPortraitOrientation ? Axis.horizontal : Axis.vertical,
          separatorBuilder: (_, __) {
            return isPortraitOrientation ? const SizedBox(width: 10) : const SizedBox(height: 20);
          },
          itemBuilder: (_, index) {
            return ForecastInfoCard(
              dayForecastData: state.forecastData![index],
            );
          },
        );
      },
    );
  }
}

extension TemperatureText on double {
  String get toTempText => '${this > 0 ? '+' : ''}$this\u00B0C';
}

class ForecastInfoCard extends StatelessWidget {
  final DayForecastData dayForecastData;

  const ForecastInfoCard({
    super.key,
    required this.dayForecastData,
  });

  @override
  Widget build(BuildContext context) {
    print('BUILD forecast day info');
    final bool isToday = dayForecastData.date.day == DateTime.now().day;
    final String title = isToday ? 'Today' : DateFormat('dd.MM').format(dayForecastData.date);

    return InfoCard(
      backgroundColor: context.infoTodayCardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.cardTitle,
          ),
          Text(
            dayForecastData.conditionDesc,
            style: context.info,
          ),
          AnnotatedData(
            annotation: 'max: ',
            data: dayForecastData.maxTempCelsius.toTempText,
          ),
          AnnotatedData(
            annotation: 'min: ',
            data: dayForecastData.minTempCelsius.toTempText,
          ),
          Row(
            children: [
              const Icon(
                Icons.wind_power,
                size: 18,
              ),
              AnnotatedData(
                annotation: ' max: ',
                data: dayForecastData.maxWindVelocityKpH.toString(),
              ),
              Text(
                ' km/h',
                style: context.infoAnnotation,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CurrentData extends StatelessWidget {
  const CurrentData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenCubit, MainScreenState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            state.currentWeatherData!.currentConditionDesc,
            style: context.info,
          ),
          Text(
            state.currentWeatherData!.currentTempCelsius.toTempText,
            style: context.info,
          ),
          AnnotatedData(
            annotation: 'Feels like: ',
            data: state.currentWeatherData!.feelsLikeCelsius.toTempText,
          ),
          Row(
            children: [
              const Icon(
                Icons.wind_power,
                size: 18,
              ),
              Text(
                state.currentWeatherData!.windVelocityKpH.toString(),
                style: context.info,
              ),
              AnnotatedData(
                annotation: ' km/h, ',
                data: state.currentWeatherData!.windDirection,
              ),
            ],
          )
        ],
      );
    });
  }
}

class AnnotatedData extends StatelessWidget {
  final String annotation;
  final String data;

  const AnnotatedData({
    super.key,
    required this.annotation,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: annotation,
        style: context.infoAnnotation,
        children: [
          TextSpan(
            text: data,
            style: context.info,
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;

  const InfoCard({
    super.key,
    required this.backgroundColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: FittedBox(child: child),
    );
  }
}

enum City { Minsk, London, Moscow }

class ChooseCity extends StatefulWidget {
  const ChooseCity({super.key});

  @override
  State<ChooseCity> createState() => _ChooseCityState();
}

class _ChooseCityState extends State<ChooseCity> {
  City? city = City.Minsk;

  @override
  Widget build(BuildContext context) {
    print('BUILD choose city widget');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        City.values.length,
        (index) => Row(
          children: [
            Radio<City>(
              value: City.values[index],
              groupValue: city,
              onChanged: (City? value) {
                setState(() {
                  print('set value: $value');
                  city = value;
                });
              },
            ),
            Text(
              City.values[index].name,
              style: context.option,
            ),
          ],
        ),
      ),
    );
  }
}
