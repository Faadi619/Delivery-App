import 'package:app_876/core/constants/colors.dart';
import 'package:app_876/core/constants/styles.dart';
import 'package:app_876/ui/Screens/CustomerSideApp/HomeScreens/MainUserBottomNavigationBar.dart';
import 'package:app_876/ui/Screens/CustomerSideApp/OnBoardingScreens/OnBoardingScreens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/assets.dart';

class GenderSelectionScreen extends StatefulWidget {
  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  bool isMaleSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SizedBox(
          width: 1.sw,
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Image.asset(
                  insideAppLogo,
                  width: 95.w,
                  height: 95.h,
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: 1.sw,
                  height: 340.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Image.asset(
                          genderSelectFemaleOptionImage,
                          width: 180.w,
                          height: 230.h,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          genderSelectMaleOptionImage,
                          width: 180.w,
                          height: 230.h,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                avenir55RomanText(
                  text: 'Find the best service near by',
                  fontSize: 25.sp,
                ),
                SizedBox(height: 10.h),
                avenir55RomanText(
                  text: 'Browser services for',
                  fontSize: 18.sp,
                ),
                SizedBox(height: 10.h),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMaleSelected = true;
                    });
                    Get.to(MainUserBottomNavigationBar());
                  },
                  child: CustomGloballyUsedButtonWidget(centerTitle: 'MALE'),
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMaleSelected = false;
                    });
                    Get.to(MainUserBottomNavigationBar());
                  },
                  child: CustomGloballyUsedButtonWidget(centerTitle: 'FEMALE'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
