import 'package:json_annotation/json_annotation.dart';
import 'package:test_weather_app/domain/domain_models/weather_data.dart';

part 'weather_api_model.g.dart';

@JsonSerializable()
class WeatherApiModel {
  final Location location;
  final CurrentData current;
  final Forecast forecast;

  WeatherApiModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherApiModel.fromJson(Map<String, dynamic> json) => _$WeatherApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherApiModelToJson(this);

  WeatherData get toWeatherDataModel {
    List<DayForecastData> dayForecastDataList = [];

    for (var element in forecast.forecastday) {
      dayForecastDataList.add(DayForecastData(
        date: element.date,
        conditionDesc: element.day.condition.text,
        maxTempCelsius: element.day.maxtemp_c,
        minTempCelsius: element.day.mintemp_c,
        maxWindVelocityKpH: element.day.maxwind_kph,
      ));
    }

    return WeatherData(
      currentWeatherData: CurrentWeatherData(
        locationName: location.name,
        currentConditionDesc: current.condition.text,
        currentTempCelsius: current.temp_c,
        feelsLikeCelsius: current.feelslike_c,
        windVelocityKpH: current.wind_kph,
        windDirection: current.wind_dir,
      ),
      dailyForecast: dayForecastDataList,
    );
  }
}

@JsonSerializable()
class Location {
  final String name;

  Location({
    required this.name,
  });

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class CurrentData {
  final double temp_c;
  final Condition condition;
  final double wind_kph;
  final String wind_dir;
  final double feelslike_c;

  CurrentData({
    required this.temp_c,
    required this.condition,
    required this.wind_kph,
    required this.wind_dir,
    required this.feelslike_c,
  });

  factory CurrentData.fromJson(Map<String, dynamic> json) => _$CurrentDataFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentDataToJson(this);
}

@JsonSerializable()
class Condition {
  final String text;

  Condition({
    required this.text,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

@JsonSerializable()
class Forecast {
  final List<DayForecast> forecastday;

  Forecast({
    required this.forecastday,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}

@JsonSerializable()
class DayForecast {
  final DateTime date;
  final GeneralDayData day;

  DayForecast({
    required this.date,
    required this.day,
  });

  factory DayForecast.fromJson(Map<String, dynamic> json) => _$DayForecastFromJson(json);

  Map<String, dynamic> toJson() => _$DayForecastToJson(this);
}

@JsonSerializable()
class GeneralDayData {
  final double maxtemp_c;
  final double mintemp_c;
  final double maxwind_kph;
  final Condition condition;

  GeneralDayData({
    required this.maxtemp_c,
    required this.mintemp_c,
    required this.maxwind_kph,
    required this.condition,
  });

  factory GeneralDayData.fromJson(Map<String, dynamic> json) => _$GeneralDayDataFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralDayDataToJson(this);
}
