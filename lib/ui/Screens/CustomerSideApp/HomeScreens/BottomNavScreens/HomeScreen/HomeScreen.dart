import 'package:app_876/ui/CustomWidgets/HomeScreenAppBar.dart';
import 'package:app_876/ui/CustomWidgets/SearchBarWidget.dart';
import 'package:app_876/ui/Screens/CustomerSideApp/HomeScreens/BottomNavScreens/HomeScreen/HomeScreenModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../core/constants/assets.dart';
import '../../UserDrawer.dart';
import 'ServiceScreen.dart/ServiceMapListScreen.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController homeScreenSearchController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: UserDrawar(),
      appBar: HomeScreenAppBarWidget(
        centerWidget: Image.asset(
          whiteLogo,
          width: 28.w,
          height: 48.h,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 15.h),
          SearchBarWidget(
            searchController: homeScreenSearchController,
            hintText: 'Events, restaurants, hairstylists',
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: GridView.builder(
              itemCount: serviceImages.length,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 14.0,
                mainAxisSpacing: 14.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Get.to(() => ServicesMapScreen());
                  },
                  child: Image.asset(serviceImages[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
