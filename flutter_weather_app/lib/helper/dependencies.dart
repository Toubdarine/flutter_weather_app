import 'package:get/get.dart';

import '../controllers/weather_data_controller.dart';

import '../data/api/api_client.dart';
import '../data/repositories/weather_data_repo.dart';

import '../utils/app_constants.dart';

Future<void> init() async {
//This method initializes and sets up various objects and services that are used by the Flutter-Weather-app .

//ApiClient
//The ApiClient object is created and added to the dependency injection framework, 'Get',
// with the baseUrl specified as AppConstants.BASE_URL. The ApiClient object is responsible for sending HTTP requests to the API.

//WeatherDataRepo
//The WeatherDataRepo object is created and added to 'Get'.
//The WeatherDataRepo object is a repository that serves as an intermediary between the data access layer and the business logic layer of the application.
// In this case, it uses the ApiClient to retrieve weather data from the API.

//WeatherDataController
//The WeatherDataController object is created and added to Get.
//The WeatherDataController object is a controller that defines the business logic for the application.
// It uses the WeatherDataRepo to retrieve weather data from the API.

//The Get.lazyPut method is used to add the objects to Get in a lazy manner,
// meaning that they will only be created and initialized when they are actually needed by the application.
//The fenix: true argument is used to specify that the WeatherDataController should be reinitialized
// every time a new route is pushed onto the navigator's stack.

// in this project i'm not using a backend so requests are send directaly to the openweathermap api.
// it's never like this in real project because i'm sending  api secret key in the url.
// and it means that this key should be stored in the client (flutter app) and could be retrieved by reverse engineering.

// api client

  Get.lazyPut(() => ApiClient(
        baseUrl: AppConstants.BASE_URL,
      ));

// repos

  Get.lazyPut(() => WeatherDataRepo(apiClient: Get.find()));

// controllers

  Get.lazyPut(() => WeatherDataController(weatherDataRepo: Get.find()),
      fenix: true);
}
