import 'package:flutter/material.dart';
import 'package:weather_app/models/wheather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WheatherModel? _wheatherData;
  String? cityName;
  set wheatherData(WheatherModel? wheather) {
    _wheatherData = wheather;
    notifyListeners();
  }

  WheatherModel? get WheatherData => _wheatherData;
}
