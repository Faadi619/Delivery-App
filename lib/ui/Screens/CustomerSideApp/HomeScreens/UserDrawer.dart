import 'package:app_876/core/constants/assets.dart';
import 'package:app_876/core/constants/colors.dart';
import 'package:app_876/core/constants/styles.dart';
import 'package:app_876/ui/Screens/CustomerSideApp/OnBoardingScreens/OnBoardingScreens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserDrawar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
          height: 1.sh,
          width: 290.w,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(35.r),
              bottomRight: Radius.circular(35.r),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 200.h + ScreenUtil().statusBarHeight,
                  decoration: BoxDecoration(
                      color: darkGreyColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35.r),
                          bottomRight: Radius.circular(35.r))),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60.r,
                          child: Icon(
                            Icons.person,
                            size: 60.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        avenir55RomanText(
                          text: 'Benjamin',
                          fontSize: 20.sp,
                          color: whiteColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    DrawerItemsWidget(
                      leadingIconImgae: drawerFavoriteServicesImage,
                      title: "Favorites Services",
                    ),
                    SizedBox(height: 20.h),
                    DrawerItemsWidget(
                      leadingIconImgae: drawerPaymentMethodImage,
                      title: "Payment methods",
                    ),
                    SizedBox(height: 10.h),
                    Divider(
                      color: blackColor,
                      thickness: 1,
                      indent: 50.w,
                      endIndent: 50.w,
                    ),
                    SizedBox(height: 10.h),
                    DrawerItemsWidget(
                      leadingIconImgae: drawerShareAppImage,
                      title: "Share App",
                    ),
                    SizedBox(height: 20.h),
                    DrawerItemsWidget(
                      leadingIconImgae: drawarAboutUsImage,
                      title: "About us",
                    ),
                    SizedBox(height: Get.height / 5),
                    Align(
                      alignment: Alignment.center,
                      child: CustomGloballyUsedButtonWidget(
                        width: 180.w,
                        height: 50.h,
                        centerTitle: "Log Out",
                        color: redColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

class DrawerItemsWidget extends StatelessWidget {
  final String leadingIconImgae;
  final String title;

  DrawerItemsWidget({
    required this.leadingIconImgae,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO: Add functionality here
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            Image.asset(
              leadingIconImgae,
              width: 20.w,
              height: 20.h,
            ),
            SizedBox(width: 30.w),
            avenir55RomanText(
              text: title,
              fontSize: 20.sp,
            )
          ],
        ),
      ),
    );
  }
}
