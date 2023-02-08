import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late CurvedAnimation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 60))
          ..forward();
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 87, 158, 216),
              Color.fromARGB(255, 135, 76, 175)
            ])),
          ),
          Positioned(
            bottom: 20,
            child: GestureDetector(
              onTap: () {
                print("tap tap");
                Get.toNamed(RouteHelper.getWeatherDataRoute());
              },
              child: Container(
                margin: EdgeInsets.all(40),
                height: 60,
                width: MediaQuery.of(context).size.width - 80,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 150, 0, 117),
                    borderRadius: BorderRadius.circular(60)),
                child: Center(
                    child: Text(
                  'Commencer',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                )),
              ),
            ),
          ),
          Positioned(
            top: 150,
            child: GestureDetector(
              onTap: () {
                print("tap tap");
                Get.toNamed(RouteHelper.getWeatherDataRoute());
              },
              child: Container(
                  margin: EdgeInsets.all(40),
                  height: 260,
                  width: MediaQuery.of(context).size.width - 80,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(60)),
                  child: Center(
                      child: Text('Flutter Weather App',
                          style:
                              TextStyle(fontSize: 34, color: Colors.white)))),
            ),
          ),
        ],
      ),
    );
  }
}
