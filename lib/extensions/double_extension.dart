extension TemperatureText on double {
  String get toTempText => '${this > 0 ? '+' : ''}$this\u00B0C';
}
