import '../views/screens/home_screen.dart';
import '../views/screens/weather_data_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String homeRoute = "/";
  static const String weatherDataRoute = "/weather-data-screen";

  static String getHomeRoute() {
    return homeRoute;
  }

  static String getWeatherDataRoute() {
    return weatherDataRoute;
  }

  static List<GetPage> routes = [
    GetPage(
        arguments: null,
        transition: Transition.size,
        name: homeRoute,
        page: () {
          return const HomeScreen();
        }),
    GetPage(
        arguments: null,
        transition: Transition.size,
        name: weatherDataRoute,
        page: () {
          return const WeatherDataScreen();
        }),
  ];
}
