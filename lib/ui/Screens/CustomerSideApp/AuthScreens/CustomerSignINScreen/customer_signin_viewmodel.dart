import 'dart:developer';

import 'package:app_876/ui/Screens/CustomerSideApp/HomeScreens/MainUserBottomNavigationBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerSignInViewModel extends ChangeNotifier {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  bool isLoading = false;

  signIn() async {
    isLoading = true;
    notifyListeners();
    await FirebaseFirestore.instance
        .collection("CustomerUsers")
        .get()
        .then((value) async {
      value.docs.forEach((element) {
        if (element.data()['email'] == emailTextController.text &&
            element.data()['password'] == passwordTextController.text) {
          Get.to(MainUserBottomNavigationBar());
          log("success");
        } else {
          //snackbar
          Get.snackbar("Error", "Invalid Email or Password",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white);
        }
      });
    });
    isLoading = false;
    notifyListeners();
  }
}
