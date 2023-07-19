import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class WheatherModel {
 DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WheatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});
//assin value  change ...no final
  // WheatherModel.fromJson(dynamic data){
  //     var jsonDataKey = data['forecast']['forecastday'][0];
  //        date= data['location']['localtime'];
  //       temp= jsonDataKey['avgtemp_c'];
  //       maxTemp= jsonDataKey['maxtemp_c'];
  //       minTemp= jsonDataKey['mintemp_c'];
  //       weatherStateName= jsonDataKey['condition']['text'];
  // }
  // convert normal constrector to constrector return value
  factory WheatherModel.fromJson(dynamic data) {
    var jsonDataKey = data['forecast']['forecastday'][0]['day'];
    print(' jsonDataKey========$jsonDataKey');
    print('tempppppppppp=${jsonDataKey['avgtemp_c']}');
    return WheatherModel(
        date: DateTime.parse(data['current']['last_updated']),
        //data['location']['localtime'],
        temp: jsonDataKey['avgtemp_c'],
        maxTemp: jsonDataKey['maxtemp_c'],
        minTemp: jsonDataKey['mintemp_c'],
        weatherStateName: jsonDataKey['condition']['text']);
  }
  //return object

  @override
  String toString() {
    return 'data===$date///////////temp=$temp  // mintemp=$minTemp ///maxtemp =$maxTemp ///////////';
  }

   String getImage() {
    if (weatherStateName == 'Sunny' || weatherStateName == 'Clear' ||  weatherStateName == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (
        
        weatherStateName == 'Blizzard' ||  weatherStateName == 'snow'  ||  weatherStateName == 'sleet ' || weatherStateName == 'Patchy freezing drizzle possible' || weatherStateName == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' ||  weatherStateName == 'Heavy Cloud' || weatherStateName == 'Mist' || weatherStateName == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light rain ' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thundery outbreaks possible' || weatherStateName == 'Moderate or heavy snow with thunder' || weatherStateName == 'Patchy light snow with thunder'|| weatherStateName == 'Moderate or heavy rain with thunder' || weatherStateName == 'Patchy light rain with thunder' || weatherStateName =='Thunder'|| weatherStateName =='Thunderstorm'||weatherStateName=='Moderate rain') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }



  MaterialColor getThemeColor() {
    if (weatherStateName == 'Sunny' || weatherStateName == 'Clear' ||  weatherStateName == 'partly cloudy') {
      return Colors.orange;
    } else if (
        
        weatherStateName == 'Blizzard' ||  weatherStateName == ' snow '  ||  weatherStateName == ' sleet ' || weatherStateName == 'Patchy freezing drizzle possible' || weatherStateName == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' ||  weatherStateName == 'Heavy Cloud' || weatherStateName == 'Mist' || weatherStateName == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light rain ' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherStateName == 'Thundery outbreaks possible' || weatherStateName == 'Moderate or heavy snow with thunder' || weatherStateName == 'Patchy light snow with thunder'|| weatherStateName == 'Moderate or heavy rain with thunder' || weatherStateName == 'Patchy light rain with thunder'||weatherStateName=='Moderate rain' ) {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
