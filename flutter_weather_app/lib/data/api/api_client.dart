import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  final String baseUrl;
  ApiClient({required this.baseUrl});
}
