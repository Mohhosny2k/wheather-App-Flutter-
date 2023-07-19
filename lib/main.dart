import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/wheather_model.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/pages/onboarding_screen.dart';
import 'package:weather_app/pages/splash_screen.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        //return wheather;
        return WeatherProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // WheatherModel? wheather;
    // return ChangeNotifierProvider(
    //   create: (context) {
    //     //return wheather;
    //     return WeatherProvider();
    //   },
    return MaterialApp(
      theme: ThemeData(
         brightness: Brightness.dark,
        primarySwatch:
            Provider.of<WeatherProvider>(context).WheatherData == null
                ? Colors.blue
                : Provider.of<WeatherProvider>(context)
                    .WheatherData!
                    .getThemeColor(),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        'homePage': (context) => HomePage(),
        'boarding': (context) => onBoardingScreen(),
      },
      home: SplashScreen(),
    );
    //);
  }
}
