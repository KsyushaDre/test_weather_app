import 'package:test_weather_app/domain/domain_models/weather_data.dart';

abstract class WeatherRepository {
  Future<WeatherData?> getWeatherData();

  Future<void> saveWeatherData(WeatherData weatherData);
}