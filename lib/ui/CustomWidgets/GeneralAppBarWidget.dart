import 'package:app_876/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/constants/colors.dart';

class GeneralAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  GeneralAppBarWidget({required this.title});

  @override
  Size get preferredSize => Size.fromHeight(130);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(130.h),
      child: Container(
        height: 130.h,
        width: 1.sw,
        decoration: BoxDecoration(
          color: darkGreyColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.r),
            bottomRight: Radius.circular(30.r),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 26.sp,
                    color: whiteColor,
                  ),
                ),
                avenir55RomanText(
                  text: title,
                  fontSize: 20.sp,
                  color: whiteColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
