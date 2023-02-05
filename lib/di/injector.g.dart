// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureData() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton<WeatherApi>((c) => WeatherApiImpl())
      ..registerSingleton<WeatherRepository>((c) => WeatherRepositoryImpl());
  }

  @override
  void _configureDomain() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => GetWeatherDataUseCase(
        weatherRepository: c<WeatherRepository>(),
        weatherApi: c<WeatherApi>()));
  }

  @override
  void _configurePresentation() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) =>
        MainScreenCubit(getWeatherDataUseCase: c<GetWeatherDataUseCase>()));
  }
}
