import 'package:get/get.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../controllers/weather_data_controller.dart';

import '../data/api/api_client.dart';
import '../data/repositories/weather_data_repo.dart';

import '../utils/app_constants.dart';

Future<void> init() async {
  // in this project i'm not using a backend so requests are send directaly to the api.
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
