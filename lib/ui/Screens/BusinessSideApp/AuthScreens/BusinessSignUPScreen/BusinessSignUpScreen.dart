import 'dart:developer';

import 'package:app_876/core/constants/assets.dart';
import 'package:app_876/core/constants/colors.dart';
import 'package:app_876/core/constants/styles.dart';
import 'package:app_876/core/extensions/string_extension.dart';
import 'package:app_876/ui/Screens/BusinessSideApp/AuthScreens/BusinessSignUPScreen/business_signup_viewmodel.dart';
import 'package:app_876/ui/Screens/CustomerSideApp/AuthScreens/CustomerSignUPScreen/CustomerSignUpScreen.dart';
import 'package:app_876/ui/Screens/CustomerSideApp/OnBoardingScreens/OnBoardingScreens.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

enum DropDownType {
  serviceCategory,
  genderCategory,
  numberOfEmployees,
}

// ignore: must_be_immutable
class BusinessSignUpScreen extends StatelessWidget {
  final List<String> serviceCategoryList = [
    'Adult Bars Entertainment',
    'Architect',
    'Auto Mechanic',
    'Barbers',
    'Beautician',
    'Boutiques',
    'Construction',
    'Dentist',
    'Designer Stylist',
    'Doctors',
    'Gym',
    'Hair Stylist',
    'Hardware',
    'Hotels',
    'Message Therapist',
    'Night Club',
    'Personal Trainer',
    'Realtors',
  ];

  final List<String> genderList = [
    'Male',
    'Female',
  ];

  final List<String> numberofEmployeesList = [
    '3-5',
    '6-10',
    '11-15',
    '16-20',
    '20-24',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BusinessSignUpViewModel>(builder: (context, model, child) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 1.sw,
                height: 260.h,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: darkGreyColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.r),
                          bottomRight: Radius.circular(30.r),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -70.h,
                      child: InkWell(
                        onTap: () {
                          model.pickImage(ImageSource.gallery);
                        },
                        child: Column(
                          children: [
                            model.image != null
                                ? CircleAvatar(
                                    backgroundImage: FileImage(model.image!),
                                    radius: 65.r,
                                  )
                                : Container(
                                    width: 130.w,
                                    height: 130.h,
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: greyColor.withOpacity(0.2),
                                          spreadRadius: 0.1,
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.camera_alt,
                                          color: greyColor,
                                          size: 40.sp,
                                        ),
                                        SizedBox(height: 5.h),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: avenir55RomanText(
                                            text: 'Upload Company Logo',
                                            fontSize: 12.sp,
                                            color: greyColor,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 90.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SafeArea(
                  top: false,
                  child: Column(
                    children: [
                      CustomDropDownField(
                        leadingImage: serviceCategoryIcon,
                        hintText: 'Service Category',
                        title: 'Service Category',
                        Items: serviceCategoryList,
                        dropDownType: DropDownType.serviceCategory,
                      ),
                      SizedBox(height: 20.h),
                      TextFieldwithTitleWidget(
                        controller: model.businessNoController,
                        hintText: 'Registration number (opt)',
                        title: 'Business Reg. No.',
                      ),
                      SizedBox(height: 20.h),
                      CustomDropDownField(
                        leadingImage: genderSelectionIcon,
                        hintText: 'Male or Female',
                        title: 'Services for',
                        Items: genderList,
                        dropDownType: DropDownType.genderCategory,
                      ),
                      SizedBox(height: 20.h),
                      CustomDropDownField(
                        leadingImage: numberOfEmployeesIcon,
                        hintText: '3-5',
                        title: 'Number of employees',
                        Items: numberofEmployeesList,
                        dropDownType: DropDownType.numberOfEmployees,
                      ),
                      SizedBox(height: 20.h),
                      TextFieldwithTitleWidget(
                        controller: model.businessPhoneNumberController,
                        hintText: 'Mobile/phone number',
                        title: 'Business Phone number',
                      ),
                      SizedBox(height: 20.h),
                      TextFieldwithTitleWidget(
                        controller: model.businessEmailController,
                        hintText: 'Email',
                        title: 'Business Email',
                      ),
                      SizedBox(height: 20.h),
                      TextFieldwithTitleWidget(
                        controller: model.businessPasswordController,
                        hintText: 'Password',
                        title: 'Password',
                      ),
                      SizedBox(height: 20.h),
                      TextFieldwithTitleWidget(
                        controller: model.businessWebsiteController,
                        hintText: 'www.yourbusiness.com',
                        title: 'Business Website',
                      ),
                      SizedBox(height: 20.h),
                      TextFieldwithTitleWidget(
                        height: 100.h,
                        textFieldMaxLines: 4,
                        controller: model.businessDetailsController,
                        hintText: 'Business Details',
                        title: 'About business',
                      ),
                      SizedBox(height: 50.h),
                      model.loading == true
                          ? kCircularProgress()
                          : GestureDetector(
                              onTap: () async {
                                log("model is loading ${model.isLoading}");
                                if (model.phoneList.contains(
                                    model.businessPhoneNumberController.text)) {
                                  Get.snackbar(
                                    'Error',
                                    'Phone Number already exists',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                } else if (model.emailList.contains(
                                    model.businessEmailController.text)) {
                                  Get.snackbar(
                                    'Error',
                                    'Email already exists',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                } else {
                                  await model.phoneAuthentication();
                                }
                              },
                              child: CustomGloballyUsedButtonWidget(
                                  centerTitle: model.isLoading == false
                                      ? 'NEXT'
                                      : "Loading"),
                            ),
                      SizedBox(height: 50.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

// ignore: must_be_immutable
class CustomDropDownField extends StatefulWidget {
  final List<String> Items;
  final String leadingImage;
  final String hintText;
  final String title;
  final Enum dropDownType;
  CustomDropDownField({
    required this.Items,
    required this.leadingImage,
    required this.hintText,
    required this.title,
    required this.dropDownType,
  });

  @override
  State<CustomDropDownField> createState() => _CustomDropDownField();
}

class _CustomDropDownField extends State<CustomDropDownField> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<BusinessSignUpViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        avenir55RomanText(
          text: widget.title,
          fontSize: 16.sp,
          color: blackColor.withOpacity(0.5),
        ),
        SizedBox(height: 5.h),
        SizedBox(
          height: 50.h,
          width: double.infinity,
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: SizedBox(
                height: 30.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      widget.leadingImage,
                      scale: 2.7,
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                        child: avenir55RomanText(
                      text: widget.hintText,
                      fontSize: 13.sp,
                    )),
                  ],
                ),
              ),
              items: widget.Items.map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Row(
                      children: [
                        avenir55RomanText(
                          text: item,
                          fontSize: 13.sp,
                        )
                      ],
                    ),
                  )).toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
                switch (widget.dropDownType) {
                  case DropDownType.serviceCategory:
                    {
                      model.getServiceCategoryBool(value.toString());
                    }
                    break;

                  case DropDownType.genderCategory:
                    {
                      model.getGenderBool(value.toString());
                    }
                    break;

                  case DropDownType.numberOfEmployees:
                    {
                      model.getNumberOfEmployeesBool(value.toString());
                    }
                    break;
                }
                log(model.serviceCategoryBool.toString());
                log(model.genderCategoryBool.toString());
                log(model.numberOfEmployeesBool.toString());
              },

              icon: Icon(Icons.keyboard_arrow_down_rounded),
              iconSize: 35.sp,
              iconEnabledColor: blackColor,
              buttonHeight: 50.h,
              buttonWidth: 260.w,
              buttonPadding: EdgeInsets.only(left: 14, right: 14),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: lightGreyColor,
              ),
              // dropdownOverButton: true,
              buttonElevation: 0,
              itemHeight: 40,
              itemPadding: EdgeInsets.only(left: 14, right: 14),
              dropdownMaxHeight: 200.h,
              dropdownWidth: 260,
              dropdownPadding: EdgeInsets.only(left: 50.w),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                color: Colors.white,
              ),
              dropdownElevation: 8,
              scrollbarRadius: Radius.circular(25),
              scrollbarThickness: 6,
              scrollbarAlwaysShow: false,
              offset: Offset(-20, 0),
            ),
          ),
        ),
      ],
    );
  }
}
