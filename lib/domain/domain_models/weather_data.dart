import 'package:json_annotation/json_annotation.dart';

part 'weather_data.g.dart';

@JsonSerializable()
class WeatherData {
  final DateTime updateDate;
  final CurrentWeatherData currentWeatherData;
  final List<DayForecastData> dailyForecast;

  WeatherData({
    required this.updateDate,
    required this.currentWeatherData,
    required this.dailyForecast,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}

@JsonSerializable()
class CurrentWeatherData {
  final String locationName;
  final String currentConditionDesc;
  final double currentTempCelsius;
  final double feelsLikeCelsius;
  final double windVelocityKpH;
  final String windDirection;

  CurrentWeatherData({
    required this.locationName,
    required this.currentConditionDesc,
    required this.currentTempCelsius,
    required this.feelsLikeCelsius,
    required this.windVelocityKpH,
    required this.windDirection,
  });

  factory CurrentWeatherData.fromJson(Map<String, dynamic> json) => _$CurrentWeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherDataToJson(this);
}

@JsonSerializable()
class DayForecastData {
  final DateTime date;
  final String conditionDesc;
  final double maxTempCelsius;
  final double minTempCelsius;
  final double maxWindVelocityKpH;

  DayForecastData({
    required this.date,
    required this.conditionDesc,
    required this.maxTempCelsius,
    required this.minTempCelsius,
    required this.maxWindVelocityKpH,
  });

  factory DayForecastData.fromJson(Map<String, dynamic> json) => _$DayForecastDataFromJson(json);

  Map<String, dynamic> toJson() => _$DayForecastDataToJson(this);
}
