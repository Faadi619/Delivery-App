import 'package:app_876/Model/business_user_model.dart';
import 'package:app_876/core/constants/assets.dart';
import 'package:app_876/core/constants/colors.dart';
import 'package:app_876/core/constants/styles.dart';
import 'package:app_876/core/extensions/string_extension.dart';
import 'package:app_876/ui/Screens/CustomerSideApp/OnBoardingScreens/OnBoardingScreens.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BusinessBankAccountAdditionScreen.dart';

class WorkDaysRoutineScreen extends StatefulWidget {
  WorkDaysRoutineScreen({Key? key}) : super(key: key);

  @override
  State<WorkDaysRoutineScreen> createState() => _WorkDaysRoutineScreen();
}

class _WorkDaysRoutineScreen extends State<WorkDaysRoutineScreen> {
  BusinessUserModel businessUserModel = BusinessUserModel();
  // TextFeildata assigndata = TextFeildata();
  bool isChecked = false;
  bool islOading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                avenir55RomanText(
                  text: "Set Weekly Duties hours",
                  fontSize: 22.sp,
                ),
                SizedBox(height: 20.h),
                Image.asset(
                  workingTimeImage,
                  width: 140.w,
                  height: 140.h,
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: avenir55RomanText(
                        text: "Days",
                        fontSize: 16.sp,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: avenir55RomanText(
                        text: "From",
                        fontSize: 16.sp,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: avenir55RomanText(
                        text: "To",
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: days.length,
                  itemBuilder: (context, index) {
                    return DutyDays(days: days[index], index: index);
                  },
                ),
                SizedBox(height: 50.h),
                islOading
                    ? kCircularProgress()
                    : GestureDetector(
                        onTap: () async {
                          setState(() {
                            islOading = true;
                          });
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          var uid = prefs.getString('buid');
                          //add data to firebase as map
                          await FirebaseFirestore.instance
                              .collection("BusinessUsers")
                              .doc(uid)
                              .collection("workDailyRoutine")
                              .doc(uid)
                              .set({
                            "WorkDays": selectdaya,
                            "uid": uid,
                          });
                          setState(() {
                            islOading = false;
                          });

                          await Get.to(() => BusinessBankDetailScreen());
                        },
                        child:
                            CustomGloballyUsedButtonWidget(centerTitle: "Next"),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List days = [
  "Monday",
  "Tuesday",
  "Wendnesday",
  "Thursday",
  "Firday",
  "Saturday",
  "Sunday",
];
List<String> selectdaya = [];

class DutyDays extends StatefulWidget {
  final String days;
  final int index;

  DutyDays({
    required this.days,
    required this.index,
  });

  @override
  State<DutyDays> createState() => _DutyDaysState();
}

class _DutyDaysState extends State<DutyDays> {
  // TextFeildata assigndata = TextFeildata();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                checkColor: Colors.white,
                // fillColor: baseColor,
                fillColor: MaterialStateProperty.all(blackColor),
                value: isChecked,
                shape: CircleBorder(),
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;

                    if (isChecked == true) {
                      selectdaya.add(widget.days);
                      // textFeildata.SelectDays = selectdaya;
                      // TextFeildata().SelectDays.add(widget.days);

                      // return TextFeildata().SelectDays.add(widget.days);
                    } else {
                      // assigndata.SelectDays.remove(widget.days);
                      selectdaya.remove(widget.days);
                    }
                  });
                },
              ),
              avenir55RomanText(
                text: widget.days,
                fontSize: 18.sp,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.center,
            height: 30.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: lightGreyColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: avenir55RomanText(
              text: widget.index <= 4 ? "10:30 AM" : "Closed",
              fontSize: 18.sp,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.center,
            height: 30.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: lightGreyColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: avenir55RomanText(
              text: widget.index <= 4 ? "6:00 PM" : "Closed",
              fontSize: 18.sp,
            ),
          ),
        ),
      ],
    );
  }
}
