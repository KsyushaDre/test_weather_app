import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather_app/domain/domain_models/weather_data.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_cubit.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_state.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_widgets/forecast_info_card.dart';

class ForecastInfoList extends StatelessWidget {
  const ForecastInfoList({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isPortraitOrientation = MediaQuery.of(context).orientation == Orientation.portrait;

    return BlocSelector<MainScreenCubit, MainScreenState, List<DayForecastData>?>(
      selector: (state) => state.forecastData,
      builder: (context, forecastDataList) {
        if (forecastDataList != null) {
          return ListView.separated(
            itemCount: forecastDataList.length,
            scrollDirection: isPortraitOrientation ? Axis.horizontal : Axis.vertical,
            separatorBuilder: (_, __) {
              return isPortraitOrientation ? const SizedBox(width: 10) : const SizedBox(height: 20);
            },
            itemBuilder: (_, index) {
              return ForecastInfoCard(
                dayForecastData: forecastDataList[index],
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
