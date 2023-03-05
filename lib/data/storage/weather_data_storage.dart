import 'package:test_weather_app/domain/domain_models/weather_data.dart';

abstract class WeatherDataStorage {
  Future<WeatherData?> get();

  Future<void> save(WeatherData weatherData);
}
