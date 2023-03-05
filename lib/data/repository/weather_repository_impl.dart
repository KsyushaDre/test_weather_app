import 'package:test_weather_app/data/api/weather_data_api.dart';
import 'package:test_weather_app/data/storage/weather_data_storage.dart';
import 'package:test_weather_app/domain/domain_models/weather_data.dart';
import 'package:test_weather_app/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataApi weatherDataApi;
  final WeatherDataStorage weatherDataStorage;

  WeatherRepositoryImpl({
    required this.weatherDataApi,
    required this.weatherDataStorage,
  });

  @override
  Future<WeatherData?> getWeatherDataFromApi({required String locationName}) async {
    WeatherData? weatherData = await weatherDataApi.get(locationName);
    if (weatherData != null) {
      await weatherDataStorage.save(weatherData);
    }
    return weatherData;
  }

  @override
  Future<WeatherData?> getWeatherDataFromLocalStorage() async {
    return weatherDataStorage.get();
  }

  @override
  Future<void> saveWeatherDataToLocalStorage(WeatherData weatherData) async {
    weatherDataStorage.save(weatherData);
  }
}
