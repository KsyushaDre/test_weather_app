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
      final response = await _dio.get(_baseUrl, queryParameters: queryParams);

      if (response.data.length == 0) {
        return null;
      } else {
        WeatherApiModel weatherApiModel = WeatherApiModel.fromJson(response.data);
        return weatherApiModel.toWeatherDataModel;
      }
    } on DioError catch (_) {
      throw Exception('Could not get weather data from the API.');
    } catch (_) {
      rethrow;
    }
  }
}
