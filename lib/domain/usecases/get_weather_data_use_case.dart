import 'package:test_weather_app/domain/api/weather_api.dart';
import 'package:test_weather_app/domain/domain_models/weather_data.dart';
import 'package:test_weather_app/domain/repository/weather_repository.dart';

class GetWeatherDataUseCase {
  final WeatherRepository weatherRepository;
  final WeatherApi weatherApi;

  GetWeatherDataUseCase({
    required this.weatherRepository,
    required this.weatherApi,
  });

  Future<WeatherData?> execute() {
    return weatherApi.getWeatherData(locationName: 'Minsk');
  }
}
