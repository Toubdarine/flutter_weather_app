import 'package:get/get.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../controllers/weather_data_controller.dart';

import '../data/api/api_client.dart';
import '../data/repositories/weather_data_repo.dart';

import '../utils/app_constants.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(
        baseUrl: 'AppConstants.BASE_URL',
      ));

  // repos

  Get.lazyPut(() => WeatherDataRepo(apiClient: Get.find()));

  // controllers

  Get.lazyPut(() => WeatherDataController(weatherDataRepo: Get.find()),
      fenix: true);
}
