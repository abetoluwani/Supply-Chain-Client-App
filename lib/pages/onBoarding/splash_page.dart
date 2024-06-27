import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'package:trademale/utilities/dimensions.dart';
import 'package:trademale/utilities/routeHelper.dart';

import '../../utilities/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      //is the duration from init the page until go to initial
      Duration(seconds: 4),
      () async {
        Box box = await Hive.openBox('myBox');
        String? token = await box.get(kToken);
        if (token != null) {
          Get.offAllNamed(routeHelper.getHead("0"));
        } else {
          Get.offAllNamed(routeHelper.getStarted());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieBuilder.asset(
                'assets/animations/Animation - 1708433147163.json'),
            Text(
              'TradeMale',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: Dimension.font26 * 1.3,
                  fontFamily: 'Schyler',
                  letterSpacing: 2),
            ),
          ],
        ),
      ),
      //   nextScreen: HomePage(),
      //   backgroundColor: Colors.black,
      // ),
    );
  }
}
