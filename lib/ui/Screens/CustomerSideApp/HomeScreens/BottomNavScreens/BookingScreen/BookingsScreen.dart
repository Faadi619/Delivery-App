import 'package:app_876/core/constants/colors.dart';
import 'package:app_876/core/constants/styles.dart';
import 'package:app_876/ui/CustomWidgets/HomeScreenAppBar.dart';
import 'package:app_876/ui/Screens/CustomerSideApp/HomeScreens/UserDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'BookingScreenTabs/CompletedOrdersTabScreen.dart';
import 'BookingScreenTabs/UpcomingOrdersTabScreen.dart';

class BookingScreenTab extends StatefulWidget {
  const BookingScreenTab({super.key});

  @override
  State<BookingScreenTab> createState() => _BookingScreenTab();
}

class _BookingScreenTab extends State<BookingScreenTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: UserDrawar(),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: UserDrawar(),
          appBar: HomeScreenAppBarWidget(
            centerWidget: avenir55RomanText(
              text: 'Appointments',
              fontSize: 20.sp,
              color: whiteColor,
            ),
          ),
          body: Column(
            children: [
              SizedBox(height: 30.h),
              SizedBox(
                height: 60.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: AppointmentTabBarButtonWidget(),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: TabBarView(
                  children: [
                    UpcomingOrdersTabScreen(),
                    CompletedOrdersTabScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentTabBarButtonWidget extends StatelessWidget {
  const AppointmentTabBarButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black.withOpacity(0.5),
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(50), // Creates border
        color: greenColor,
      ),
      padding: EdgeInsets.all(8.r),
      tabs: [
        Tab(
          height: 30.h,
          text: "Upcoming",
        ),
        Tab(
          height: 30.h,
          text: "Completed",
        ),
      ],
    );
  }
}
