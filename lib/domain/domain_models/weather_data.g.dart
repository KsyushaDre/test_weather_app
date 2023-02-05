// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
      updateDate: DateTime.parse(json['updateDate'] as String),
      currentWeatherData: CurrentWeatherData.fromJson(
          json['currentWeatherData'] as Map<String, dynamic>),
      dailyForecast: (json['dailyForecast'] as List<dynamic>)
          .map((e) => DayForecastData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'updateDate': instance.updateDate.toIso8601String(),
      'currentWeatherData': instance.currentWeatherData,
      'dailyForecast': instance.dailyForecast,
    };

CurrentWeatherData _$CurrentWeatherDataFromJson(Map<String, dynamic> json) =>
    CurrentWeatherData(
      locationName: json['locationName'] as String,
      currentConditionDesc: json['currentConditionDesc'] as String,
      currentTempCelsius: (json['currentTempCelsius'] as num).toDouble(),
      feelsLikeCelsius: (json['feelsLikeCelsius'] as num).toDouble(),
      windVelocityKpH: (json['windVelocityKpH'] as num).toDouble(),
      windDirection: json['windDirection'] as String,
    );

Map<String, dynamic> _$CurrentWeatherDataToJson(CurrentWeatherData instance) =>
    <String, dynamic>{
      'locationName': instance.locationName,
      'currentConditionDesc': instance.currentConditionDesc,
      'currentTempCelsius': instance.currentTempCelsius,
      'feelsLikeCelsius': instance.feelsLikeCelsius,
      'windVelocityKpH': instance.windVelocityKpH,
      'windDirection': instance.windDirection,
    };

DayForecastData _$DayForecastDataFromJson(Map<String, dynamic> json) =>
    DayForecastData(
      date: DateTime.parse(json['date'] as String),
      conditionDesc: json['conditionDesc'] as String,
      maxTempCelsius: (json['maxTempCelsius'] as num).toDouble(),
      minTempCelsius: (json['minTempCelsius'] as num).toDouble(),
      maxWindVelocityKpH: (json['maxWindVelocityKpH'] as num).toDouble(),
    );

Map<String, dynamic> _$DayForecastDataToJson(DayForecastData instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'conditionDesc': instance.conditionDesc,
      'maxTempCelsius': instance.maxTempCelsius,
      'minTempCelsius': instance.minTempCelsius,
      'maxWindVelocityKpH': instance.maxWindVelocityKpH,
    };
