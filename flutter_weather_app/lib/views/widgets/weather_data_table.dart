import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';

import '../../controllers/weather_data_controller.dart';
import '../../models/weather_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';

class WeatherDataTable extends StatelessWidget {
  const WeatherDataTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<WeatherDataController>(
        initState: (_) {},
        builder: (controller) {
          // Check if all requests have succeeded
          // else Show animated error text, error message is agnostic to the error type

          return (controller.getCityList.length == 5 && !controller.isLoading)
              ?
              // if cityList in WeatherDataController contains 5 items, it means that all request succeeded
              SizedBox(
                  height: screenHeight / 1.7,
                  width: screenWidth,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: ((context, index) {
                      return _buildItem(controller.getCityList[index]);
                    }),
                    itemCount: controller.getCityList.length,
                  ),
                )
              :
              // if errors occur while api call it shows an error message in an animated text
              Container(
                  height: screenHeight / 4,
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  width: screenWidth,
                  child: Center(
                      child: SizedBox(
                    height: 60,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          FadeAnimatedText(
                              'Une Erreur s\'est produite pendant le téléchargement des données'),
                          FadeAnimatedText('essayer une autre fois'),
                        ],
                        onTap: null,
                        pause: const Duration(seconds: 1),
                        isRepeatingAnimation: true,
                        repeatForever: true,
                      ),
                    ),
                  )),
                );
        });
  }

  // build the weather data line in the weather data table
  Widget _buildItem(WeatherDataModel weatherData) {
    return SizedBox(
        width: 300,
        height: 80,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 50,
                ),
                SizedBox(
                    width: 150,
                    child: Text(weatherData.cityName,
                        style: const TextStyle(
                            fontSize: 16, color: AppColors.mainTextColor))),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${(weatherData.temperature).toInt()}°',
                        style: const TextStyle(
                            fontSize: 16, color: AppColors.mainTextColor)),
                    Image.network(
                        '${AppConstants.WEATHER_ICON_URL}${weatherData.iconCod}.png')
                  ],
                ))
              ],
            ),
            const Divider()
          ],
        ));
  }
}
