import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather_app/domain/domain_models/weather_data.dart';
import 'package:test_weather_app/extensions/context_extension.dart';
import 'package:test_weather_app/extensions/double_extension.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_cubit.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_state.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_widgets/annotated_data_text.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_widgets/info_card.dart';

class CurrentInfoCard extends StatelessWidget {
  const CurrentInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      backgroundColor: context.infoNowCardColor,
      child: BlocSelector<MainScreenCubit, MainScreenState, CurrentWeatherData>(
        selector: (state) => state.currentWeatherData!,
        builder: (context, currentWeatherData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currentWeatherData.currentConditionDesc,
                style: context.info,
              ),
              Text(
                currentWeatherData.currentTempCelsius.toTempText,
                style: context.info,
              ),
              AnnotatedDataText(
                annotation: 'Feels like: ',
                data: currentWeatherData.feelsLikeCelsius.toTempText,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.wind_power,
                    size: 18,
                  ),
                  Text(
                    currentWeatherData.windVelocityKpH.toString(),
                    style: context.info,
                  ),
                  AnnotatedDataText(
                    annotation: ' km/h, ',
                    data: currentWeatherData.windDirection,
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
