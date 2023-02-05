import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather_app/domain/domain_models/weather_data.dart';
import 'package:test_weather_app/domain/usecases/get_weather_data_use_case.dart';
import 'package:test_weather_app/presentation/main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  final GetWeatherDataUseCase getWeatherDataUseCase;

  MainScreenCubit({required this.getWeatherDataUseCase}) : super(const MainScreenState(isLoading: true));

  Future<void> getWeatherData() async {
    WeatherData? weatherData = await getWeatherDataUseCase.execute();
    //todo check null
    emit(state.copyWith(
      currentWeatherData: weatherData!.currentWeatherData,
      todayData: weatherData.dailyForecast[0],
      forecastData: weatherData.dailyForecast.sublist(1),
      isLoading: false,
    ));
  }

// void decrement() => emit(state - 1);
}
