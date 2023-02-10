import 'dart:convert';

import 'package:flutter_weather_app/models/weather_model.dart';
import 'package:get/get.dart';

import '../api/api_client.dart';

class WeatherDataRepo extends GetxService {
  final ApiClient apiClient;

  Map<String, String> cityMap = {
    '0': 'rennes',
    '10': 'paris',
    '20': 'nantes',
    '30': 'bordeaux',
    '40': 'lyon'
  };

  WeatherDataRepo({
    required this.apiClient,
  });

  Future<WeatherDataModel?> getWeather(int cityIndex) async {
    WeatherDataModel? weatherData;

    // Check if the city map contains the specified city index
    if (cityMap.containsKey(cityIndex.toString())) {
      String city = cityMap[cityIndex.toString()]!;

      // Send a request to get weather data for the city
      try {
        var response = await apiClient.getData(city);
        if (response != null) {
          if (response.statusCode == 200) {
            var weatherDataMap = jsonDecode(response.body);
            String cityName = weatherDataMap['name'];
            List<String> parts = cityName.split(" ");
            cityName = parts.last;
            double temp = weatherDataMap['main']['temp'] - 273.15;

            weatherData = WeatherDataModel(
                id: weatherDataMap['id'].toString(),
                cityName: cityName,
                temperature: temp,
                skyState: weatherDataMap['weather'][0]['description'],
                iconCod: weatherDataMap['weather'][0]['icon']);
          }
        }
      } catch (e) {
        // Handle the exception by printing an error message

      }
    }

    return weatherData;
  }
}
