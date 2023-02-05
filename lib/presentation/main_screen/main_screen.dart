import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_cubit.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_state.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_widgets/choose_city.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_widgets/current_info.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_widgets/forecast_info_list.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_widgets/today_info.dart';

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

  final Widget chooseCityWidget = const ChooseCity();
  final Widget currentInfoWidget = const CurrentInfo();
  final Widget todayInfoWidget = const TodayInfo();
  final Widget forecastInfoListWidget = const ForecastInfoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocSelector<MainScreenCubit, MainScreenState, bool>(
          selector: (state) => state.isLoading,
          builder: (context, isLoading) {
            if (!isLoading) {
              return OrientationBuilder(
                builder: (context, orientation) {
                  switch (orientation) {
                    case Orientation.portrait:
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          chooseCityWidget,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Flexible(
                                flex: 1,
                                child: currentInfoWidget,
                              ),
                              const SizedBox(width: 8),
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
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
