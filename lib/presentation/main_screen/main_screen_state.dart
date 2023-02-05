import 'package:equatable/equatable.dart';
import 'package:test_weather_app/domain/domain_models/weather_data.dart';
import 'package:test_weather_app/domain/enums/city.dart';

class MainScreenState extends Equatable {
  final bool isLoading;
  final City city;
  final CurrentWeatherData? currentWeatherData;
  final DayForecastData? todayData;
  final List<DayForecastData>? forecastData;

  const MainScreenState({
    this.isLoading = true,
    this.city = City.Minsk,
    this.currentWeatherData,
    this.todayData,
    this.forecastData,
  });

  MainScreenState copyWith({
    bool? isLoading,
    City? city,
    CurrentWeatherData? currentWeatherData,
    DayForecastData? todayData,
    List<DayForecastData>? forecastData,
  }) {
    return MainScreenState(
      isLoading: isLoading ?? this.isLoading,
      city: city ?? this.city,
      currentWeatherData: currentWeatherData ?? this.currentWeatherData,
      todayData: todayData ?? this.todayData,
      forecastData: forecastData ?? this.forecastData,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        city,
        currentWeatherData,
        todayData,
        forecastData,
      ];
}
