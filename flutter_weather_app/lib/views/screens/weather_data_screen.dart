import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_cloud_bg.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_color_bg.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_night_star_bg.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_rain_snow_bg.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_thunder_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/image_utils.dart';
import 'package:flutter_weather_bg_null_safety/utils/print_utils.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';

class WeatherDataScreen extends StatelessWidget {
  const WeatherDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 87, 158, 216),
              Color.fromARGB(255, 135, 76, 175)
            ])),
          ),
          Positioned(
            bottom: 20,
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                child: GestureDetector(
                  onTap: () {
                    print("tap tap");
                    Get.back();
                  },
                  child: Container(
                    margin: EdgeInsets.all(40),
                    height: 60,
                    width: MediaQuery.of(context).size.width - 80,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 150, 0, 117),
                        borderRadius: BorderRadius.circular(60)),
                    child: Center(
                        child: Text(
                      'Recommencer',
                      style: TextStyle(fontSize: 22),
                    )),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
