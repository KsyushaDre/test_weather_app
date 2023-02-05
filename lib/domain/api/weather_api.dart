import 'package:test_weather_app/domain/domain_models/weather_data.dart';

abstract class WeatherApi {
  Future<WeatherData?> getWeatherData({required String locationName});
}
