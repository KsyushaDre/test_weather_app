import 'package:test_weather_app/domain/enums/city.dart';

extension ConvertToCity on String {
  City toCity() {
    switch (this) {
      case 'Minsk':
        return City.Minsk;
      case 'London':
        return City.London;
      case 'Moscow':
        return City.Moscow;
      default:
        throw Exception('Could not convert String to City');
    }
  }
}
