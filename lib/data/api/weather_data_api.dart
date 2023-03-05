import 'package:test_weather_app/domain/domain_models/weather_data.dart';

abstract class WeatherDataApi {
  Future<WeatherData?> get(String locationName);
}
