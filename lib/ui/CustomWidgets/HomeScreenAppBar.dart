import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/constants/assets.dart';
import '../../core/constants/colors.dart';
import '../Screens/CustomerSideApp/HomeScreens/UserProfileScreen.dart';

class HomeScreenAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget centerWidget;
  HomeScreenAppBarWidget({required this.centerWidget});

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Image.asset(drawerIcon, width: 25.w, height: 25.h),
                ),
                centerWidget,
                InkWell(
                  onTap: () {
                    //TODO: Add appropriate function here
                    Get.to(() => UserProfileScreen());
                  },
                  child: CircleAvatar(
                    radius: 15.r,
                    child: Icon(Icons.person),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
