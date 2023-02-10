import 'package:flutter/material.dart';
import './helper/dependencies.dart' as dep;
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'routes/route_helper.dart';

void main() async {
// Ensure that the Flutter framework is initialized before the rest of the code is executed.
  WidgetsFlutterBinding.ensureInitialized();
// Initialize and set up various objects and services used by the application.
  await dep.init();
// Set the preferred orientation of the device to portrait mode with the top edge facing upwards.
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
// Start the Flutter application by calling runApp and passing it the root widget of the app.
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: RouteHelper.getHomeRoute(),
      getPages: RouteHelper.routes,
    );
  }
}
