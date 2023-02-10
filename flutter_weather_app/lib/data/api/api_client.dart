import 'package:flutter_dotenv/flutter_dotenv.dart';

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
      response = await http.get(uri);

      return response;
    } catch (e) {
      //print('error ================= $e');
    }
    return response;
  }
}
