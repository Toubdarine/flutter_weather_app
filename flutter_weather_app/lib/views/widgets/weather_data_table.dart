import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/weather_data_controller.dart';
import '../../models/weather_model.dart';
import '../../utils/app_constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WeatherDataTable extends StatelessWidget {
  final Map<String, WeatherDataModel> weatherMap;
  WeatherDataTable({super.key, required this.weatherMap});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeatherDataController>(
        initState: (_) {},
        builder: (controller) {
          // Check if all requests have succeeded
          // else Show animated error text, error message is agnostic to the error type
          return (controller.getCityList.length == 5)
              ?
              // if cityList in WeatherDataController contains 5 items, it means that all request succeeded
              Container(
                  height: MediaQuery.of(context).size.height / 1.7,
                  width: MediaQuery.of(context).size.width,
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
                  height: 200,
                  padding: EdgeInsets.only(left: 40, right: 40),
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Container(
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
                        pause: Duration(seconds: 1),
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
    return Container(
        width: 300,
        height: 80,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 150,
                    child: Center(child: Text('${weatherData.cityName}'))),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${(weatherData.temperature).toInt()}'),
                    Image.network(AppConstants.WEATHER_ICON_URL +
                        '${weatherData.iconCod}.png')
                  ],
                ))
              ],
            ),
            Divider()
          ],
        ));
  }
}
