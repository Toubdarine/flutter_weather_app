import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/views/widgets/progression_bar.dart';
import 'package:flutter_weather_app/views/widgets/weather_data_table.dart';
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

import '../../controllers/weather_data_controller.dart';

class WeatherDataScreen extends StatelessWidget {
  const WeatherDataScreen({super.key});
  final bool _apiCompleted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: GetBuilder<WeatherDataController>(builder: (controller) {
        return Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 87, 158, 216),
                Color.fromARGB(255, 135, 76, 175)
              ], begin: Alignment.centerLeft, end: Alignment.topRight)),
            ),
            !controller.isLoading
                ? Positioned(
                    top: 100,
                    child: WeatherDataTable(
                      weatherMap: {},
                    ))
                : Container(),
            Positioned(
              left: !controller.isLoading ? 0 : 40,
              bottom: !controller.isLoading ? 20 : 40,
              child: !controller.isLoading
                  ? GestureDetector(
                      onTap: () {
                        print("tap tap");
                        controller.removeDoesCallApiForCityMap();
                        controller.setIsLoading = true;
                      },
                      child: Container(
                        margin: EdgeInsets.all(40),
                        height: 50,
                        width: MediaQuery.of(context).size.width - 80,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 150, 0, 117),
                            borderRadius: BorderRadius.circular(60)),
                        child: Center(
                            child: Text(
                          'Recommencer',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        )),
                      ),
                    )
                  : CustomProgressionBar(),
            ),
            Positioned(
              top: 30,
              child: Container(
                child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
              ),
            )
          ]),
        );
      }),
    );
  }
}
