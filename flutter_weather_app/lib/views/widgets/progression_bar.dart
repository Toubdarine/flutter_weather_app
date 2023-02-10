import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../controllers/weather_data_controller.dart';
import '../../utils/app_colors.dart';

class CustomProgressionBar extends StatefulWidget {
  const CustomProgressionBar({super.key});

  @override
  State<CustomProgressionBar> createState() => _CustomProgressionBarState();
}

class _CustomProgressionBarState extends State<CustomProgressionBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  int _elapsedTime = 0;
  bool _isFirstFiveCalls = false;
// percentage progression
  int progression = 0;
  // control repeatation in the animated text
  bool repeatingWaitingText = true;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 60));

    _controller.addListener(() {
      animationHandler();
    });
    _controller.forward();
    // the first api call is done right after the controller start animating
    if (_controller.isAnimating) {
      Get.find<WeatherDataController>().getWeatherByCity(_elapsedTime);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          Container(
            width: screenWidth - 80,
          ),
          SizedBox(
            height: 60,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  FadeAnimatedText('Nous téléchargeons les données'),
                  FadeAnimatedText('C\'est presque fini ...'),
                  FadeAnimatedText(
                      'Plus que quelques secondes avant \nd\'avoir les resultat ...'),
                ],
                onTap: null,
                pause: const Duration(seconds: 3),
                isRepeatingAnimation: repeatingWaitingText,
                repeatForever: true,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: screenWidth - 80,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                          width: 40,
                          child: Center(
                              child: Text(
                            "%$progression",
                            style:
                                const TextStyle(color: AppColors.buttonColor),
                          )))
                    ],
                  ),
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Container(
                      width: 20 + ((screenWidth - 100) * _controller.value),
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: AppColors.progressionBarGradient),
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// function  in the _controller to handle api call according to time
// the first api call is done right after the controller start animating
  void animationHandler() {
    if (_controller.status == AnimationStatus.completed) {
      // Execute function when the animation has completed
      Get.find<WeatherDataController>().setIsLoading = false;
      setState(() {
        repeatingWaitingText = false;
      });
    }
    // _controller.value * 100).round() can give the same result for more than one _controller.value
    // the if statement prevent unnecessary repeatation
    if ((_controller.value * 100).round() != progression) {
      setState(() {
        progression = (_controller.value * 100).round();
      });
    }

    double controllerValue = _controller.value * 60;
    //avoid unnecessary update
    //_controller.value* 60 start from 0 to 60
    // there's no garantee that _controller.value* 60 equals a specific integer like 10,20,30,40

    if (controllerValue < _elapsedTime + 10 &&
        controllerValue > _elapsedTime &&
        !_isFirstFiveCalls) {
      //doesCallApiForCityMap will record if an api call occured for a specific city key or not
      // so when _controller.value change it won't necessary cause an api call

      bool doesCall = Get.find<WeatherDataController>()
              .doesCallApiForCityMap(_elapsedTime.toString()) ??
          false;
      !doesCall
          ? Get.find<WeatherDataController>().getWeatherByCity(_elapsedTime)
          : null;
    } else if (_elapsedTime < 50) {
      _elapsedTime += 10;
      Get.find<WeatherDataController>().getWeatherByCity(_elapsedTime);
    }

    if (_elapsedTime > 40) {
      _isFirstFiveCalls = true;
    }
  }

  @override
  void dispose() {
    _controller.removeListener(() {});
    _controller.dispose();

    super.dispose();
  }
}
