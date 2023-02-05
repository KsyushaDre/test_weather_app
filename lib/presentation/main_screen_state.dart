import 'package:equatable/equatable.dart';
import 'package:test_weather_app/domain/domain_models/weather_data.dart';

class MainScreenState extends Equatable {
  final bool isLoading;
  final CurrentWeatherData? currentWeatherData;
  final DayForecastData? todayData;
  final List<DayForecastData>? forecastData;

  const MainScreenState({
    required this.isLoading,
    this.currentWeatherData,
    this.todayData,
    this.forecastData,
  });

  MainScreenState copyWith({
    bool? isLoading,
    CurrentWeatherData? currentWeatherData,
    DayForecastData? todayData,
    List<DayForecastData>? forecastData,
  }) {
    return MainScreenState(
      isLoading: isLoading ?? this.isLoading,
      currentWeatherData: currentWeatherData ?? this.currentWeatherData,
      todayData: todayData ?? this.todayData,
      forecastData: forecastData ?? this.forecastData,
    );
  }

  @override
  List<Object?> get props => [isLoading, currentWeatherData, todayData, forecastData];
}