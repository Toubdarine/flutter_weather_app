import 'package:flutter_weather_app/models/weather_model.dart';
import 'package:get/get.dart';

import '../data/repositories/weather_data_repo.dart';

class WeatherDataController extends GetxController implements GetxService {
  final WeatherDataRepo weatherDataRepo;

  WeatherDataController({required this.weatherDataRepo});
  // Map to keep track of whether the API has been called for a particular city
  final Map<String, bool> _doesCallApiForCityMap = {};

// List to store the weather data for each city
  final List<WeatherDataModel> _cityList = [];

  bool _isLoading = true;
  // Getter for the isLoading flag
  bool get isLoading => _isLoading;
  // Setter for the isLoading flag
  set setIsLoading(bool newState) {
    _isLoading = newState;
    update();
  }

// Function to check if the API has been called for a particular city
  bool? doesCallApiForCityMap(String key) {
    bool? result;
    _doesCallApiForCityMap.containsKey(key)
        ? result = _doesCallApiForCityMap[key]
        : null;
    return result;
  }

  // Getter for the cityList
  List<WeatherDataModel> get getCityList => _cityList;

  // Function to get the weather data for a particular city
  Future<void> getWeatherByCity(int index) async {
    _doesCallApiForCityMap["$index"] = true;
    WeatherDataModel? weatherData = await weatherDataRepo.getWeather(index);
    if (weatherData != null) {
      _cityList.add(weatherData);
    }
  }

  // Function to remove all data from _doesCallApiForCityMap and _cityList t
  void removeDoesCallApiForCityMap() {
    _doesCallApiForCityMap.clear();
    _cityList.clear();
  }
}
