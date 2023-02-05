
import 'package:dio/dio.dart';
import 'package:test_weather_app/data/api_models/weather_api_model.dart';
import 'package:test_weather_app/domain/api/weather_api.dart';
import 'package:test_weather_app/domain/domain_models/weather_data.dart';

const String _apiKey = '4600a0230ddd4c32865142614233101';
const String _baseUrl = 'http://api.weatherapi.com/v1/forecast.json';

class WeatherApiImpl implements WeatherApi {

  final _dio = Dio();

  @override
  Future<WeatherData?> getWeatherData({required String locationName}) async {

    final queryParams = {
      'key': _apiKey,
      'q': locationName,
      'days': 4,
    };

    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: queryParams,
      );

      if (response.data.length == 0) {
        return null;
      } else {
        WeatherApiModel weatherApiModel = WeatherApiModel.fromJson(response.data);
        print('location.name: ${weatherApiModel.location.name} \n'
            'current.temp_c : ${weatherApiModel.current.temp_c} \n'
            'current.condition.text : ${weatherApiModel.current.condition.text} \n'
            'current.wind_kph : ${weatherApiModel.current.wind_kph} \n'
            'current.wind_dir : ${weatherApiModel.current.wind_dir} \n'
            'current.feelslike_c : ${weatherApiModel.current.feelslike_c} \n');
        weatherApiModel.forecast.forecastday.forEach((element) {
          print('   forecastday.date_epoch ${element.date} \n'
              '   forecastday.day.maxtemp_c ${element.day.maxtemp_c} \n'
              '   forecastday.day.mintemp_c ${element.day.mintemp_c} \n'
              '   forecastday.day.maxwind_kph ${element.day.maxwind_kph} \n'
              '   forecastday.day.condition.text ${element.day.condition.text} \n'
              '   ---   '
          );
        });
        return weatherApiModel.toWeatherDataModel;

      }
    } on DioError catch (_) {
      rethrow;
    } on Exception catch (e) {
      print(e);
    }
  }
}