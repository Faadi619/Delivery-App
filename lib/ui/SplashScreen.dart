import 'dart:async';

import 'package:app_876/core/constants/colors.dart';
import 'package:app_876/core/constants/assets.dart';
import 'package:app_876/ui/ServiceSelectionScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants/styles.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Get.offAll(() => ServiceSelectionScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Lottie.asset(splashScreenAnimation, fit: BoxFit.fill),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  appIconBlack,
                  scale: 2,
                ),
                SizedBox(height: 5.h),
                avenir55RomanText(
                  text: 'App876',
                  color: whiteColor,
                  fontSize: 18.sp,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
