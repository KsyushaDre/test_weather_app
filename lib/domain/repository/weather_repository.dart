import 'package:test_weather_app/domain/domain_models/weather_data.dart';

abstract class WeatherRepository {
  Future<WeatherData?> getWeatherDataFromApi({required String locationName});

  Future<WeatherData?> getWeatherDataFromLocalStorage();

  Future<void> saveWeatherDataToLocalStorage(WeatherData weatherData);
}
