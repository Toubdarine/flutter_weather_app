import 'package:get/get.dart';

import '../data/repositories/weather_data_repo.dart';

class WeatherDataController extends GetxController implements GetxService {
  final WeatherDataRepo weatherDataRepo;
  WeatherDataController({required this.weatherDataRepo});
}
