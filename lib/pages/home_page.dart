import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/wheather_model.dart';
import 'package:weather_app/pages/search_page.dart';

import '../providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void ubdateUi() {
    setState(() {
      print('seeeeeeeeeeeeeeeeeeeeeeetstattttttttttttttttttttttttttttttte');
    });
  }

  WheatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).WheatherData;

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage(
                    ubdateUi: ubdateUi,
                  );
                }));
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: Provider.of<WeatherProvider>(context, listen: true).WheatherData ==
              null
          ? Center(
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('there is no weather  start ',
                    style: TextStyle(
                      fontSize: 30,
                    )),
                    //😔🔍
                Text(
                  'searching now 🔍',
                  style: TextStyle(fontSize: 30),
                )
              ],
            ))
          : Container(
              decoration: BoxDecoration(
                 gradient: LinearGradient(
                colors: [
                  weatherData!.getThemeColor(),
                  weatherData!.getThemeColor()[300]!,
                  weatherData!.getThemeColor()[100]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                 ),
                // color:Provider.of<WeatherProvider>(context).WheatherData == null
                // ? Colors.blue
                // : Provider.of<WeatherProvider>(context)
                //     .WheatherData!
                //     .getThemeColor(),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 3,
                    ),
                    Text(
                      Provider.of<WeatherProvider>(context).cityName!,
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      //'udated: ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                      'udated:${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(weatherData!.getImage()),
                        Text(
                          //'${weatherData!.temp.toInt()}',
                          weatherData!.temp.toInt().toString() ,
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Text('maxTemp:${weatherData!.maxTemp.toInt()}'),
                            Text('minTemp:${weatherData!.minTemp.toInt()}'),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      weatherData!.weatherStateName ,
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 5,
                    ),
                  ]),
            ),
    );
  }
}
