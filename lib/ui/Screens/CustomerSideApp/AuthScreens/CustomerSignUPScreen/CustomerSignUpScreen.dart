import 'package:app_876/core/constants/colors.dart';
import 'package:app_876/core/constants/styles.dart';
import 'package:app_876/core/extensions/string_extension.dart';
import 'package:app_876/ui/Screens/CustomerSideApp/AuthScreens/CustomerSignUPScreen/customer_sign_up_viewmodel.dart';
import 'package:app_876/ui/Screens/CustomerSideApp/OnBoardingScreens/OnBoardingScreens.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/assets.dart';

class CustomerSignUpScreen extends StatefulWidget {
  @override
  State<CustomerSignUpScreen> createState() => _CustomerSignUpScreenState();
}

class _CustomerSignUpScreenState extends State<CustomerSignUpScreen> {
  bool selectedGenderIsMale = true;
  bool termsAndConditionCheckBoxValue = false;
  String countryCode = '';
  String finalPhoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerSignUpViewModel>(builder: (context, model, child) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      insideAppLogo,
                      width: 100.w,
                      height: 100.h,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SignUpUploadPhotoWidget(),
                  avenir55RomanText(
                    text: 'Create account',
                    fontSize: 25.sp,
                  ),
                  SizedBox(height: 18.h),
                  TextFieldwithTitleWidget(
                    title: 'Full Name',
                    hintText: 'john doe',
                    controller: model.nameTextController,
                  ),
                  SizedBox(height: 23.h),
                  TextFieldwithTitleWidget(
                    title: 'Email',
                    hintText: 'user@email.com',
                    controller: model.emailTextController,
                  ),
                  SizedBox(height: 23.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      avenir55RomanText(
                        text: 'Select gender',
                        fontSize: 16.sp,
                        color: blackColor.withOpacity(0.5),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGenderIsMale = true;
                              });
                            },
                            child: CustomGloballyUsedButtonWidget(
                              centerTitle: 'MALE',
                              color: selectedGenderIsMale == true
                                  ? darkGreyColor
                                  : greyColor,
                              width: 172.w,
                              height: 62.h,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGenderIsMale = false;
                              });
                            },
                            child: CustomGloballyUsedButtonWidget(
                              centerTitle: 'FEMALE',
                              color: selectedGenderIsMale == false
                                  ? darkGreyColor
                                  : greyColor,
                              width: 172.w,
                              height: 62.h,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 23.h),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: CountryCodePicker(
                          searchStyle: avenir55RomanStyle(),
                          initialSelection: 'United Kingdom',
                          textStyle: avenir55RomanStyle(),
                          textOverflow: TextOverflow.ellipsis,
                          onChanged: (value) {
                            setState(() {
                              countryCode = value.dialCode!;
                            });
                            print(
                                "this is phone number ${countryCode + model.phoneTextController.text}");
                          },
                          boxDecoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          showFlagDialog: true,
                          showFlag: false,
                        ),
                      ),
                      TextFieldwithTitleWidget(
                        width: 310.w,
                        title: 'Phone Number',
                        hintText: '398-981287-4',
                        controller: model.phoneTextController,
                      ),
                    ],
                  ),
                  SizedBox(height: 23.h),
                  TextFieldwithTitleWidget(
                    title: 'Password',
                    hintText: 'Enter Password',
                    controller: model.passwordTextController,
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Checkbox(
                        fillColor: MaterialStateProperty.all(greenColor),
                        shape: CircleBorder(),
                        value: termsAndConditionCheckBoxValue,
                        onChanged: (value) {
                          setState(
                            () {
                              termsAndConditionCheckBoxValue = value!;
                            },
                          );
                        },
                      ),
                      avenir55RomanText(
                        text: 'I have read & agree with Terms & Conditions',
                        fontSize: 16.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  model.loading
                      ? kCircularProgress()
                      : GestureDetector(
                          onTap: () async {
                            setState(() {
                              finalPhoneNumber =
                                  countryCode + model.phoneTextController.text;
                            });
                            if (termsAndConditionCheckBoxValue == false) {
                              Get.snackbar('Error',
                                  'Please agree with terms and conditions');
                            } else {
                              if (model.emailList
                                  .contains(model.emailTextController.text)) {
                                Get.snackbar(
                                  'Error',
                                  'email already exists',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                );
                              } else if (model.phoneList
                                  .contains(finalPhoneNumber)) {
                                Get.snackbar(
                                  'Error',
                                  'Phone Number already exists',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                );
                              } else {
                                await model.phoneAuthentication(
                                    finalPhoneNumber: finalPhoneNumber,
                                    gender: selectedGenderIsMale);
                              }
                            }
                          },
                          child: CustomGloballyUsedButtonWidget(
                              centerTitle: 'SIGN UP'),
                        ),
                  SizedBox(height: 20.h),
                  Center(
                    child: avenir55RomanText(
                      text: 'Already have an account',
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back),
                        SizedBox(width: 10.w),
                        avenir55RomanText(
                          text: 'SIGN IN',
                          fontSize: 16.sp,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class TextFieldwithTitleWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final double? width;
  final double? height;
  final int? textFieldMaxLines;

  TextFieldwithTitleWidget({
    required this.controller,
    required this.hintText,
    required this.title,
    this.width,
    this.height,
    this.textFieldMaxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        avenir55RomanText(
          text: title,
          fontSize: 16.sp,
          color: blackColor.withOpacity(0.5),
        ),
        SizedBox(height: 5.h),
        Container(
          width: width ?? 388.w,
          height: height ?? 60.h,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          decoration: BoxDecoration(
            color: lightGreyColor,
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: TextField(
            controller: controller,
            maxLines: textFieldMaxLines,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: avenir55RomanStyle(
                fontSize: 16.sp,
                color: blackColor.withOpacity(0.5),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class SignUpUploadPhotoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Consumer<CustomerSignUpViewModel>(builder: (context, model, child) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  model.pickImage(ImageSource.gallery);
                },
                child: model.image != null
                    ? Container(
                        width: 88.w,
                        height: 88.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(model.image!),
                          ),
                          shape: BoxShape.circle,
                          color: lightGreyColor,
                        ),
                      )
                    : Container(
                        width: 88.w,
                        height: 88.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: lightGreyColor,
                        ),
                        child: Center(
                          child: Image.asset(
                            addCameraPhotoIcon,
                            width: 32.w,
                            height: 32.h,
                          ),
                        ),
                      ),
              ),
              SizedBox(height: 7.h),
              avenir55RomanText(
                text: 'Upload Photo',
                fontSize: 12.sp,
              )
            ],
          );
        })
      ],
    );
  }
}