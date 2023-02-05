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
  void _configureDomain() {}
  @override
  void _configurePresentation() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => MainScreenCubit(
        weatherApi: c<WeatherApi>(),
        weatherRepository: c<WeatherRepository>()));
  }
}
