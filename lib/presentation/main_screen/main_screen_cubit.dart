import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather_app/domain/domain_models/weather_data.dart';
import 'package:test_weather_app/domain/enums/city.dart';
import 'package:test_weather_app/domain/use_cases/get_initial_weather_data_use_case.dart';
import 'package:test_weather_app/domain/use_cases/get_new_weather_data_use_case.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  final GetInitialWeatherDataUseCase getInitialWeatherDataUseCase;
  final GetNewWeatherDataUseCase getNewWeatherDataUseCase;

  MainScreenCubit({
    required this.getInitialWeatherDataUseCase,
    required this.getNewWeatherDataUseCase,
  }) : super(const MainScreenState());

  Future<void> getWeatherData() async {
    try {
      final Stream<WeatherData?> weatherDataStream = getInitialWeatherDataUseCase.execute();

      await for (final weatherData in weatherDataStream) {
        if (weatherData != null) {
          _emitWeatherData(weatherData);
        }
      }
    } catch (e) {
      print(e);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> changeCity(City? city) async {
    try {
      emit(state.copyWith(city: city));
      final WeatherData? weatherApiData = await getNewWeatherDataUseCase.execute(city);

      if (weatherApiData != null) {
        _emitWeatherData(weatherApiData);
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
