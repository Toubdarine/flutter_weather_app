import 'package:get/get.dart';

import '../api/api_client.dart';

class WeatherDataRepo extends GetxService {
  final ApiClient apiClient;

  WeatherDataRepo({
    required this.apiClient,
  });
}
