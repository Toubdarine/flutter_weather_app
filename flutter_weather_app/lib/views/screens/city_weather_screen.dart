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
      body: Column(children: [
        Expanded(
            child: Stack(
          children: [
            WeatherBg(
              weatherType: WeatherType.sunny,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
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
                    ),
                  )),
            ),
          ],
        )),
      ]),
    );
  }
}
