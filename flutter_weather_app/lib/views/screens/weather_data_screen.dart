import 'package:flutter/material.dart';
import 'package:flutter_weather_app/views/widgets/progression_bar.dart';
import 'package:flutter_weather_app/views/widgets/weather_data_table.dart';
import 'package:get/get.dart';

import '../../controllers/weather_data_controller.dart';
import '../../utils/app_colors.dart';

class WeatherDataScreen extends StatelessWidget {
  const WeatherDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GetBuilder<WeatherDataController>(builder: (controller) {
        return SizedBox(
          height: screenHeight,
          child: Stack(children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              decoration: const BoxDecoration(
                  gradient: AppColors.mainBackgroundGredient),
            ),
            !controller.isLoading
                ? Positioned(
                    top: screenHeight / 8, child: const WeatherDataTable())
                : Container(),
            Positioned(
              left: !controller.isLoading ? 0 : 40,
              bottom: !controller.isLoading ? 20 : 40,
              child: !controller.isLoading
                  ? GestureDetector(
                      onTap: () {
                        controller.removeDoesCallApiForCityMap();
                        controller.setIsLoading = true;
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
                          'Recommencer',
                          style: TextStyle(
                              fontSize: 22, color: AppColors.textButtonColor),
                        )),
                      ),
                    )
                  : const CustomProgressionBar(),
            ),
            Positioned(
              top: 0,
              child: SizedBox(
                width: screenWidth,
                height: screenHeight / 6,
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.mainIconColor,
                        )),
                    const Expanded(
                      child: Text('Météo France',
                          style: TextStyle(
                              fontSize: 22, color: AppColors.textButtonColor)),
                    )
                  ],
                ),
              ),
            )
          ]),
        );
      }),
    );
  }
}
