import 'package:app_876/core/constants/assets.dart';
import 'package:app_876/core/constants/colors.dart';
import 'package:app_876/core/constants/styles.dart';
import 'package:app_876/ui/Screens/CustomerSideApp/AuthScreens/customer_authscreens_viewmodel.dart';
import 'package:app_876/ui/Screens/CustomerSideApp/OnBoardingScreens/OnBoardingScreens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class GetLocationScreen extends StatelessWidget {
  const GetLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerAuthScreenViewModel>(
        builder: (context, model, child) {
      return ModalProgressHUD(
        inAsyncCall: model.loading,
        child: Scaffold(
          body: SafeArea(
            child: SizedBox(
              width: 1.sw,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      location,
                      width: 300.w,
                      height: 300.h,
                    ),
                    SizedBox(height: 100.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: avenir55RomanText(
                        text: 'Turn on location',
                        fontSize: 30.sp,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    avenir55RomanText(
                      text: 'Locate nearby services providers',
                      fontSize: 20.sp,
                    ),
                    SizedBox(height: 30.h),
                    GestureDetector(
                      onTap: () {
                        model.getLocation(context);
                      },
                      child: CustomGloballyUsedButtonWidget(
                          centerTitle: 'ENABLE MY LOCATION'),
                    ),
                    SizedBox(height: 30.h),
                    CustomGloballyUsedButtonWidget(
                      centerFontColor: blackColor,
                      borderColor: blackColor,
                      color: Colors.transparent,
                      centerTitle: 'SKIP FOR NOW',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
