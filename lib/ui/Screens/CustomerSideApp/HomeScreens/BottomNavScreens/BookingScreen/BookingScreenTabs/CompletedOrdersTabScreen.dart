import 'package:app_876/core/constants/colors.dart';
import 'package:app_876/core/constants/styles.dart';
import 'package:app_876/ui/Screens/CustomerSideApp/OnBoardingScreens/OnBoardingScreens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'UpcomingOrdersTabScreen.dart';

class CompletedOrdersTabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(15.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 130.h,
                          width: 6.w,
                          decoration: BoxDecoration(
                            color: yelloColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.r),
                                bottomLeft: Radius.circular(15.r)),
                          ),
                        ),
                        AppointmentCardWidget(
                          name: appointmentCardList[index].name,
                          serviceCategory:
                              appointmentCardList[index].serviceType,
                          appointmentDate:
                              appointmentCardList[index].appointmentDate,
                          profileImage: appointmentCardList[index].profileImage,
                          topRightCornerWidget: index.isEven
                              ? GestureDetector(
                                  onTap: () {
                                    //TODO: Add rating function
                                  },
                                  child: avenir55RomanText(
                                    text: 'Rate your experience ->',
                                    fontSize: 10.sp,
                                    color: greenColor,
                                  ),
                                )
                              : CustomGloballyUsedButtonWidget(
                                  width: 125.w,
                                  height: 30.h,
                                  centerTitle: 'Payoff Now',
                                  centerFontSize: 15.sp,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
