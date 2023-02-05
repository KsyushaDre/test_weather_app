// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherApiModel _$WeatherApiModelFromJson(Map<String, dynamic> json) =>
    WeatherApiModel(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      current: CurrentData.fromJson(json['current'] as Map<String, dynamic>),
      forecast: Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherApiModelToJson(WeatherApiModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
      'forecast': instance.forecast,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      name: json['name'] as String,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
    };

CurrentData _$CurrentDataFromJson(Map<String, dynamic> json) => CurrentData(
      temp_c: (json['temp_c'] as num).toDouble(),
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
      wind_kph: (json['wind_kph'] as num).toDouble(),
      wind_dir: json['wind_dir'] as String,
      feelslike_c: (json['feelslike_c'] as num).toDouble(),
    );

Map<String, dynamic> _$CurrentDataToJson(CurrentData instance) =>
    <String, dynamic>{
      'temp_c': instance.temp_c,
      'condition': instance.condition,
      'wind_kph': instance.wind_kph,
      'wind_dir': instance.wind_dir,
      'feelslike_c': instance.feelslike_c,
    };

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
      text: json['text'] as String,
    );

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
      'text': instance.text,
    };

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
      forecastday: (json['forecastday'] as List<dynamic>)
          .map((e) => DayForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'forecastday': instance.forecastday,
    };

DayForecast _$DayForecastFromJson(Map<String, dynamic> json) => DayForecast(
      date: DateTime.parse(json['date'] as String),
      day: GeneralDayData.fromJson(json['day'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DayForecastToJson(DayForecast instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'day': instance.day,
    };

GeneralDayData _$GeneralDayDataFromJson(Map<String, dynamic> json) =>
    GeneralDayData(
      maxtemp_c: (json['maxtemp_c'] as num).toDouble(),
      mintemp_c: (json['mintemp_c'] as num).toDouble(),
      maxwind_kph: (json['maxwind_kph'] as num).toDouble(),
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeneralDayDataToJson(GeneralDayData instance) =>
    <String, dynamic>{
      'maxtemp_c': instance.maxtemp_c,
      'mintemp_c': instance.mintemp_c,
      'maxwind_kph': instance.maxwind_kph,
      'condition': instance.condition,
    };
