import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;
  ApiClient({required this.baseUrl});

  Future<http.Response?> getData(String cityName,
      {Map<String, String>? mainHeaders}) async {
    await dotenv.load(fileName: "./.env");
    String openWeatherApiKey = dotenv.env['OPEN_WEATHER_API_KEY']!;
    Uri uri = Uri.https(baseUrl, '/data/2.5/weather/',
        {'q': cityName, 'appid': openWeatherApiKey});
    http.Response? response;
    try {
      print('$baseUrl$cityName&appid=$openWeatherApiKey');
      var response = await http.get(uri);

      print('response statusCode ================= ${response.statusCode}');
      return response;
    } catch (e) {
      print('error ================= $e');
    }
  }
}
