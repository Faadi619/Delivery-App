import 'package:app_876/core/constants/colors.dart';
import 'package:app_876/core/constants/styles.dart';
import 'package:app_876/ui/CustomWidgets/GeneralAppBarWidget.dart';
import 'package:app_876/ui/CustomWidgets/TextFieldwithTitleWidget.dart';
import 'package:app_876/ui/Screens/CustomerSideApp/OnBoardingScreens/OnBoardingScreens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatelessWidget {
  final TextEditingController editNameTextController = TextEditingController();
  final TextEditingController editEmailTextController = TextEditingController();
  final TextEditingController editPhoneTextController = TextEditingController();
  final TextEditingController editAddressTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBarWidget(title: 'My Profile'),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: SafeArea(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        backgroundColor: lightGreyColor,
                        radius: 55.r,
                        child: Icon(
                          Icons.person,
                          size: 50.sp,
                        ),
                      ),
                      CircleAvatar(
                        radius: 18.r,
                        backgroundColor: whiteColor,
                        child: IconButton(
                          icon: Icon(
                            color: blackColor,
                            Icons.camera_alt,
                            size: 20.sp,
                          ),
                          onPressed: () {
                            //TODO: Camera Function here
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  TextFieldwithTitleWidget(
                    controller: editNameTextController,
                    title: "FullName",
                    hintText: 'John doe',
                  ),
                  SizedBox(height: 20.h),
                  TextFieldwithTitleWidget(
                    controller: editEmailTextController,
                    title: "Email",
                    hintText: 'user@email.com',
                  ),
                  SizedBox(height: 20.h),
                  TextFieldwithTitleWidget(
                    controller: editPhoneTextController,
                    title: "Phone Number",
                    hintText: '+1-398-981287-4',
                  ),
                  SizedBox(height: 20.h),
                  TextFieldwithTitleWidget(
                    controller: editAddressTextController,
                    title: "Address",
                    hintText: '12 ST Downtown, NY 90001',
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () {
                      //TODO: Add function here.
                      Get.back();
                    },
                    child: CustomGloballyUsedButtonWidget(
                        centerTitle: 'UPDATE PROFILE'),
                  ),
                  SizedBox(height: 40.h),
                  InkWell(
                    onTap: () {
                      //TODO: Delete Account Function here.
                    },
                    child: avenir55RomanText(
                      text: "Delete Account",
                      fontSize: 19.sp,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
