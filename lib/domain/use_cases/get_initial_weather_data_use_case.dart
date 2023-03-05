import 'package:test_weather_app/domain/domain_models/weather_data.dart';
import 'package:test_weather_app/domain/enums/city.dart';
import 'package:test_weather_app/domain/extensions/string_extensions.dart';
import 'package:test_weather_app/domain/repository/weather_repository.dart';

const City _defaultCity = City.Minsk;

class GetInitialWeatherDataUseCase {
  final WeatherRepository weatherRepository;

  GetInitialWeatherDataUseCase({required this.weatherRepository});

  Stream<WeatherData?> execute() async* {
    final WeatherData? weatherDataFromLocalStorage = await weatherRepository.getWeatherDataFromLocalStorage();
    final City city;

    if (weatherDataFromLocalStorage != null) {
      city = weatherDataFromLocalStorage.currentWeatherData.locationName.toCity();

      final DateTime currentDate = DateTime.now();
      final DateTime repoDataDate = weatherDataFromLocalStorage.updateDate;

      if (currentDate.day == repoDataDate.day && currentDate.month == repoDataDate.month) {
        yield weatherDataFromLocalStorage;
      }
    } else {
      city = _defaultCity;
    }

    yield await weatherRepository.getWeatherDataFromApi(locationName: city.name);
  }
}
