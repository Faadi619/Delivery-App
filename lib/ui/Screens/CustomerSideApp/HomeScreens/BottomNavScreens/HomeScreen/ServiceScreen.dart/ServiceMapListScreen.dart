import 'package:app_876/core/constants/colors.dart';
import 'package:app_876/core/constants/styles.dart';
import 'package:app_876/ui/CustomWidgets/SearchBarWidget.dart';
import 'package:app_876/ui/Screens/CustomerSideApp/HomeScreens/BottomNavScreens/HomeScreen/HomeScreenModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../core/constants/assets.dart';
import 'ServiceScreenModel.dart';

class ServicesMapScreen extends StatelessWidget {
  final TextEditingController serviceListScreenSearchController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            serviceScreenBackgroundMapImage,
            fit: BoxFit.fill,
          ),
          Container(
            width: 428.w,
            height: 280.h,
            decoration: BoxDecoration(
              color: darkGreyColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                    SizedBox(height: 10.h),
                    Center(
                      child: SearchBarWidget(
                        searchController: serviceListScreenSearchController,
                        hintText: "Events, restaurants, hairstylists",
                      ),
                    ),
                    SizedBox(height: 10.h),
                    avenir55RomanText(
                      text: "Category",
                      fontSize: 13,
                      color: whiteColor,
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: 60.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: serviceImages.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 12.w),
                                  child: Image.asset(
                                    serviceImages[index],
                                    scale: 3.5,
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomSheet: SizedBox(
        height: 250.h,
        width: 1.sw,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: servicesList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Get.to(
                //   ShopScreen(
                //     singleService: model.categoryList,
                //   ),
                // );
              },
              child: BottomServiceListWidget(
                serviceDetails: servicesList[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

class BottomServiceListWidget extends StatelessWidget {
  final ServiceListModel serviceDetails;
  BottomServiceListWidget({required this.serviceDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: SizedBox(
        width: 300.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 115.h,
              child: Row(
                children: [
                  Container(
                    height: 114.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.r),
                      image: DecorationImage(
                        image: AssetImage(serviceDetails.coverImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding: EdgeInsets.all(5.sp),
                        height: 27.h,
                        width: 65.w,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r),
                          ),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: yelloColor,
                              ),
                              avenir55RomanText(
                                text: serviceDetails.rating,
                                fontSize: 14.sp,
                              )
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    avenir55RomanText(
                      text: serviceDetails.name,
                      fontSize: 14,
                    ),
                    avenir55RomanText(
                      text: serviceDetails.serviceType,
                      fontSize: 12,
                    ),
                  ],
                ),
                Image.asset(
                  sendMessageFlyIcon,
                  scale: 3.5,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                avenir55RomanText(
                  text: serviceDetails.address,
                  fontSize: 12.sp,
                ),
                avenir55RomanText(
                  text: "2.7 km",
                  fontSize: 12.sp,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
