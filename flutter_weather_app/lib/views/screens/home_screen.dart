import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';
import '../../utils/app_colors.dart';

import '../../controllers/weather_data_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration:
                const BoxDecoration(gradient: AppColors.mainBackgroundGredient),
          ),
          Positioned(
            bottom: 20,
            child: GestureDetector(
              onTap: () {
                Get.find<WeatherDataController>().removeDoesCallApiForCityMap();
                Get.find<WeatherDataController>().setIsLoading = true;
                Get.toNamed(RouteHelper.getWeatherDataRoute());
              },
              child: Container(
                margin: const EdgeInsets.all(40),
                height: 50,
                width: screenWidth - 80,
                decoration: BoxDecoration(
                    color: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(60)),
                child: const Center(
                    child: Text(
                  'Commencer',
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColors.textButtonColor,
                      letterSpacing: 1.2),
                )),
              ),
            ),
          ),
          Positioned(
            top: 150,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.getWeatherDataRoute());
              },
              child: Container(
                  margin: const EdgeInsets.all(40),
                  height: screenHeight / 3,
                  width: screenWidth - 80,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(60)),
                  child: const Center(
                      child: Text('Flutter Weather App',
                          style: TextStyle(
                              fontSize: 34,
                              color: AppColors.textButtonColor,
                              fontWeight: FontWeight.w400)))),
            ),
          ),
        ],
      ),
    );
  }
}
