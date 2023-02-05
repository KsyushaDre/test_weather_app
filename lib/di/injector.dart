import 'package:kiwi/kiwi.dart';
import 'package:test_weather_app/data/api/weather_api_impl.dart';
import 'package:test_weather_app/data/repository/weather_repository_impl.dart';
import 'package:test_weather_app/domain/api/weather_api.dart';
import 'package:test_weather_app/domain/repository/weather_repository.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_cubit.dart';

part 'injector.g.dart';

abstract class Injector {
  static late KiwiContainer container;

  static Future<bool> setup() async {
    container = KiwiContainer();
    _$Injector()._configure();
    return true;
  }

  // For use from classes trying to get top-level dependencies
  static final resolve = container.resolve;

  void _configure() {
    _configureData();
    _configurePresentation();
  }

  //data
  @Register.singleton(WeatherApi, from: WeatherApiImpl)
  @Register.singleton(WeatherRepository, from: WeatherRepositoryImpl)
  void _configureData();

  //presentation
  @Register.factory(MainScreenCubit)
  void _configurePresentation();
}
