import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/wheather_model.dart';
import 'package:weather_app/services/wheather_service.dart';

import 'package:weather_app/providers/weather_provider.dart';

import '../providers/weather_provider.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key, this.ubdateUi});
  String? cityName;
  VoidCallback? ubdateUi;
  // WheatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              //  print(data);
              cityName = data;
              WeatherServices services = WeatherServices();
              WheatherModel? wheather =
                  await services.getWheather(cityName: cityName!);
              print(wheather);
              // weatherData = wheather;
              //Provider.of<WheatherModel>(context).date=wheather.date;
              Provider.of<WeatherProvider>(context,listen: false).wheatherData=wheather;
              Provider.of<WeatherProvider>(context,listen: false).cityName=cityName;
             // ubdateUi!();
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              hintText: 'Enter City',
              label: Text('Search'),
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                
                onTap : () async 
                {
                    WeatherServices services = WeatherServices();

             WheatherModel? wheather =
            await services.getWheather(cityName: cityName!);

              Provider.of<WeatherProvider>(context,listen: false).wheatherData =wheather;
                           Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;

              Navigator.pop(context);
                },
                child: Icon(Icons.search)),
            ),
          ),
        ),
      ),
    );
  }
}

 // WheatherModel? weatherData;