import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather_app/domain/api/weather_api.dart';
import 'package:test_weather_app/domain/domain_models/weather_data.dart';
import 'package:test_weather_app/domain/enums/city.dart';
import 'package:test_weather_app/domain/repository/weather_repository.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  final WeatherApi weatherApi;
  final WeatherRepository weatherRepository;

  MainScreenCubit({
    required this.weatherApi,
    required this.weatherRepository,
  }) : super(const MainScreenState());

  Future<void> getWeatherData() async {
    try {
      WeatherData? weatherRepoData = await weatherRepository.getWeatherData();

      if (weatherRepoData != null) {
        print('weatherRepoData != null');
        final DateTime currentDate = DateTime.now();
        final DateTime repoDataDate = weatherRepoData.updateDate;

        if (currentDate.day == repoDataDate.day && currentDate.month == repoDataDate.month) {
          print('it is today');
          _emitWeatherData(weatherRepoData);
        }
      }

      WeatherData? weatherApiData = await weatherApi.getWeatherData(locationName: state.city.name);

      if (weatherApiData != null) {
        print('weatherApiData != null');
        _emitWeatherData(weatherApiData);
      }
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }



  Future<void> changeCity(City? city) async {

    try {
      // WeatherData? weatherRepoData = await weatherRepository.getWeatherData();
      //
      // if (weatherRepoData != null) {
      //   print('weatherRepoData != null');
      //   final DateTime currentDate = DateTime.now();
      //   final DateTime repoDataDate = weatherRepoData.updateDate;
      //
      //   if (currentDate.day == repoDataDate.day && currentDate.month == repoDataDate.month) {
      //     print('it is today');
      //     _emitWeatherData(weatherRepoData);
      //   }

     if (city != null) {
       emit(state.copyWith(city: city));
        WeatherData? weatherApiData = await weatherApi.getWeatherData(locationName: city.name);

        if (weatherApiData != null) {
          print('changeCity weatherApiData != null');
          await weatherRepository.saveWeatherData(weatherApiData);

          _emitWeatherData(weatherApiData);

        }
      }
    } catch (e) {
      print(e);
    }
  }

  void _emitWeatherData(WeatherData weatherData) {
    emit(state.copyWith(
      city: City.values.firstWhere((city) => city.name == weatherData.currentWeatherData.locationName),
      currentWeatherData: weatherData.currentWeatherData,
      todayData: weatherData.dailyForecast[0],
      forecastData: weatherData.dailyForecast.sublist(1),
    ));
  }
}
