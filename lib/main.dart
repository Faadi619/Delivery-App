import 'package:app_876/core/provider/providers.dart';
import 'package:app_876/ui/Screens/BusinessSideApp/AuthScreens/UploadBusinessFilesScreen/UploadBusinessFilesScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(title: 'App 876'));
}

class MyApp extends StatelessWidget {
  final String title;

  static const double _designWidth = 428;
  static const double _designHeight = 926;
  const MyApp({required this.title, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: ScreenUtilInit(
        designSize: Size(_designWidth, _designHeight),
        builder: (context, widget) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          home: BusinessUploadFileScreen(),
        ),
      ),
    );
  }
}
