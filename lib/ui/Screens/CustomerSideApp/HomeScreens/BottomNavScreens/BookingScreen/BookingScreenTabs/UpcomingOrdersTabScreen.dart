import 'package:app_876/core/constants/assets.dart';
import 'package:app_876/core/constants/colors.dart';
import 'package:app_876/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AppointmentCardModel {
  String name;
  DateTime appointmentDate;
  String profileImage;
  String serviceType;

  AppointmentCardModel({
    required this.appointmentDate,
    required this.name,
    required this.profileImage,
    required this.serviceType,
  });
}

List<AppointmentCardModel> appointmentCardList = [
  AppointmentCardModel(
    appointmentDate: DateTime.now(),
    name: 'Jason',
    profileImage: dummyPersonImage1,
    serviceType: 'Haircut + Shave & Facial',
  ),
  AppointmentCardModel(
    appointmentDate: DateTime.now(),
    name: 'Jason',
    profileImage: dummyPersonImage1,
    serviceType: 'Haircut + Shave & Facial',
  ),
  AppointmentCardModel(
    appointmentDate: DateTime.now(),
    name: 'Jason',
    profileImage: dummyPersonImage1,
    serviceType: 'Haircut + Shave & Facial',
  ),
  AppointmentCardModel(
    appointmentDate: DateTime.now(),
    name: 'Jason',
    profileImage: dummyPersonImage1,
    serviceType: 'Haircut + Shave & Facial',
  ),
  AppointmentCardModel(
    appointmentDate: DateTime.now(),
    name: 'Jason',
    profileImage: dummyPersonImage1,
    serviceType: 'Haircut + Shave & Facial',
  ),
];

class UpcomingOrdersTabScreen extends StatelessWidget {
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
                          topRightCornerWidget: Image.asset(
                            appointmentCardChatIcon,
                            width: 30.w,
                          ),
                          name: appointmentCardList[index].name,
                          serviceCategory:
                              appointmentCardList[index].serviceType,
                          appointmentDate:
                              appointmentCardList[index].appointmentDate,
                          profileImage: appointmentCardList[index].profileImage,
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

class AppointmentCardWidget extends StatelessWidget {
  final DateFormat dateFormat = DateFormat("dd-MM-yyyy");
  final Widget topRightCornerWidget;

  final DateTime appointmentDate;
  final String name;
  final String profileImage;
  final String serviceCategory;

  AppointmentCardWidget({
    required this.topRightCornerWidget,
    required this.appointmentDate,
    required this.name,
    required this.profileImage,
    required this.serviceCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SizedBox(
        width: 360.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            avenir55RomanText(
              text: 'Appointment Date',
              fontSize: 12.sp,
            ),
            SizedBox(height: 7.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      darwarAppointmentImage,
                      width: 15.w,
                      height: 15.h,
                    ),
                    SizedBox(width: 10.w),
                    SizedBox(
                      width: 150.w,
                      child: avenir55RomanText(
                        text: dateFormat.format(appointmentDate),
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                topRightCornerWidget,
              ],
            ),
            SizedBox(height: 10.h),
            Divider(
              height: 0,
              color: blackColor,
              indent: 20.w,
              endIndent: 20.w,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 22.r,
                backgroundImage: AssetImage(profileImage),
              ),
              title: avenir55RomanText(
                text: name,
                fontSize: 17,
              ),
              subtitle: avenir55RomanText(
                text: serviceCategory,
                fontSize: 12,
              ),
              trailing: Image.asset(
                appointmentCardLocationIcon,
                width: 30.w,
              ),
            )
          ],
        ),
      ),
    );
  }
}
