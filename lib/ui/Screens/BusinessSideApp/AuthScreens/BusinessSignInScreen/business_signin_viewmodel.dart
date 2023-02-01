import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BusinessSignInViewModel extends ChangeNotifier {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  bool isLoading = false;

  signIn() async {
    isLoading = true;
    notifyListeners();
    await FirebaseFirestore.instance
        .collection("BusinessUsers")
        .get()
        .then((value) async {
      value.docs.forEach((element) {
        if (element.data()['email'] == emailTextController.text &&
            element.data()['password'] == passwordTextController.text) {
          print("success");
        } else {
          print("failed");
        }
      });
    });
    isLoading = false;
    notifyListeners();
  }
}
