import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_weather_app/domain/domain_models/weather_data.dart';
import 'package:test_weather_app/presentation/extensions/context_extension.dart';
import 'package:test_weather_app/presentation/extensions/double_extension.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_widgets/annotated_data_text.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_widgets/info_card.dart';

class ForecastInfoCard extends StatelessWidget {
  final DayForecastData dayForecastData;

  const ForecastInfoCard({
    super.key,
    required this.dayForecastData,
  });

  @override
  Widget build(BuildContext context) {
    final bool isToday = dayForecastData.date.day == DateTime.now().day;
    final String title = isToday ? 'Today' : DateFormat('dd.MM').format(dayForecastData.date);

    return InfoCard(
      backgroundColor: context.forecastInfoCardColor,
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
          AnnotatedDataText(
            annotation: 'max: ',
            data: dayForecastData.maxTempCelsius.toTempText,
          ),
          AnnotatedDataText(
            annotation: 'min: ',
            data: dayForecastData.minTempCelsius.toTempText,
          ),
          Row(
            children: [
              const Icon(
                Icons.wind_power,
                size: 18,
              ),
              AnnotatedDataText(
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
