
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather_app/domain/usecases/get_weather_data_use_case.dart';

abstract class MainEvent {}

class GetWeatherData implements MainEvent {}

class MainScreenBloc extends Bloc<MainEvent, int> {
  final GetWeatherDataUseCase getWeatherDataUseCase;

  MainScreenBloc({required this.getWeatherDataUseCase}) : super(0) {
    on<GetWeatherData>((event, emit) {
      getWeatherDataUseCase.execute();
    });
  }
}