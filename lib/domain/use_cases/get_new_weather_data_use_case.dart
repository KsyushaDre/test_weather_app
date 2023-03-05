import 'package:test_weather_app/domain/domain_models/weather_data.dart';
import 'package:test_weather_app/domain/enums/city.dart';
import 'package:test_weather_app/domain/repository/weather_repository.dart';

class GetNewWeatherDataUseCase {
  final WeatherRepository weatherRepository;

  GetNewWeatherDataUseCase({required this.weatherRepository});

  Future<WeatherData?> execute(City? city) async {
    if (city != null) {
      return weatherRepository.getWeatherDataFromApi(locationName: city.name);
    }
    return null;
  }
}
