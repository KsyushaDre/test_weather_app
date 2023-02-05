import 'package:test_weather_app/domain/domain_models/weather_data.dart';

abstract class WeatherApi {
  //todo change return type and parameters
  Future<WeatherData?> getWeatherData({required String locationName});
}