import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather_app/domain/domain_models/weather_data.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_cubit.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_state.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_widgets/forecast_info_card.dart';

class TodayInfo extends StatelessWidget {
  const TodayInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MainScreenCubit, MainScreenState, DayForecastData>(
      selector: (state) => state.todayData!,
      builder: (context, todayData) {
        return ForecastInfoCard(dayForecastData: todayData);
      },
    );
  }
}
