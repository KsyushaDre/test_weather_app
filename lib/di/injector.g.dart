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
      ..registerSingleton<WeatherDataApi>((c) => WeatherDataApiImpl())
      ..registerSingleton<WeatherDataStorage>((c) => WeatherDataStorageImpl())
      ..registerSingleton<WeatherRepository>((c) => WeatherRepositoryImpl(
          weatherDataApi: c<WeatherDataApi>(),
          weatherDataStorage: c<WeatherDataStorage>()));
  }

  @override
  void _configureDomain() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => GetInitialWeatherDataUseCase(
          weatherRepository: c<WeatherRepository>()))
      ..registerFactory((c) =>
          GetNewWeatherDataUseCase(weatherRepository: c<WeatherRepository>()));
  }

  @override
  void _configurePresentation() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => MainScreenCubit(
        getInitialWeatherDataUseCase: c<GetInitialWeatherDataUseCase>(),
        getNewWeatherDataUseCase: c<GetNewWeatherDataUseCase>()));
  }
}
