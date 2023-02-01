import 'package:app_876/Model/business_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UploadBusinessFilesScreen/UploadBusinessFilesScreen.dart';

class AuthViewModel extends ChangeNotifier {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardNameController = TextEditingController();
  final TextEditingController cardExpiryDateController =
      TextEditingController();
  final TextEditingController cardCVVController = TextEditingController();
  BusinessUserModel businessUserModel = BusinessUserModel();
  bool isLoading = false;
  bankDetailstoFirebase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uid = prefs.getString('buid');
    isLoading = true;
    notifyListeners();
    await FirebaseFirestore.instance
        .collection("BusinessUsers")
        .doc(uid)
        .collection("bankdetails")
        .doc(uid)
        .set({
      "cardNumber": cardNumberController.text,
      "cardName": cardNameController.text,
      "cardExpiryDate": cardExpiryDateController.text,
      "cardCVV": cardCVVController.text,
      "uid": uid,
    }).then((value) {
      Get.to(BusinessUploadFileScreen());
    });
    isLoading = false;
    notifyListeners();
  }
}
