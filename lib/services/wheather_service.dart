import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/wheather_model.dart';

// class WeatherServices {
//   String baseUrl = 'http://api.weatherapi.com/v1';
//   String apiKey = '70382c97de04407483f173424231807';
//   Future<WheatherModel> getWheather({required String cityName}) async {
//     Uri url = Uri.parse(
//         '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');
//     http.Response response = await http.get(url);

//     // Map<String, dynamic> data = jsonDecode(response.body);
//     // // print(data);
//     // // String data2 = data['location']['localtime'];
//     // // String temp = data['forecast']['forecastday'][0]['day']['avgtemp_c'];
//     // //
//     // //var jsonDataKey = data['forecast']['forecastday'][0]['day'];
//     // // WheatherModel weather = WheatherModel(
//     // //     date: data['location']['localtime'],
//     // //     temp: jsonDataKey['avgtemp_c'],
//     // //     maxTemp: jsonDataKey['maxtemp_c'],
//     // //     minTemp: jsonDataKey['mintemp_c'],
//     // //     weatherStateName: jsonDataKey['condition']['text']);
//     // WheatherModel weather = WheatherModel.fromJson(data);
//     // return weather;

//       if (response.statusCode == 400) {
//     var data  = jsonDecode(response.body);
//       throw Exception(data['error']['message']);
//     }
//     Map<String, dynamic> data = jsonDecode(response.body);

//     WheatherModel weather = WheatherModel.fromJson(data);

//     return weather;
//   }
//   }

class WeatherServices {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '70382c97de04407483f173424231807';
  Future<WheatherModel?> getWheather({required String cityName}) async {
    WheatherModel? weather;
    try {
      Uri url = Uri.parse(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');
      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);
      // print(data);
      // String data2 = data['location']['localtime'];
      // String temp = data['forecast']['forecastday'][0]['day']['avgtemp_c'];
      //
      //var jsonDataKey = data['forecast']['forecastday'][0]['day'];
      // WheatherModel weather = WheatherModel(
      //     date: data['location']['localtime'],
      //     temp: jsonDataKey['avgtemp_c'],
      //     maxTemp: jsonDataKey['maxtemp_c'],
      //     minTemp: jsonDataKey['mintemp_c'],
      //     weatherStateName: jsonDataKey['condition']['text']);
       weather = WheatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
