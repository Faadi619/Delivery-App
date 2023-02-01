import 'dart:developer';

import 'package:app_876/Model/business_user_addservice_model.dart';
import 'package:app_876/Model/business_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseServices {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;

  BusinessUserModel businessUserModel = BusinessUserModel();

  businessUserToFirebase(BusinessUserModel businessUserModel1) async {
    await firebase
        .collection('BusinessUsers')
        .doc(businessUserModel1.uid)
        .set(businessUserModel1.toFirebase());
  }

  businessUserFromFirebase(BusinessUserModel businessUserModel1) async {
    final snapshot = await firebase
        .collection('businessUsers')
        .doc(businessUserModel1.uid)
        .get();
    if (snapshot.exists) {
      return BusinessUserModel.Fromfirebase(firebase: snapshot.data());
    } else {
      log("in businessUserFromFirebase() snapshot doesn't exist");
      return BusinessUserModel();
    }
  }
  //>>>>>>>>>>>>>>>Addservice<<<<<<<<<<<<<<<<<<<<<

  businessUserAddserviceToFirebase(
      BusinessUserAddserviceModel businessAddServiceModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uid = prefs.getString('buid');
    // await FirebaseFirestore.instance
    //     .collection("arshad")
    //     .add(businessAddServiceModel.toFirebase());
    log("in businessUserAddserviceToFirebase()${businessAddServiceModel.toFirebase()}");
    await FirebaseFirestore.instance
        .collection('BusinessUsers')
        .doc(uid)
        .collection("addService")
        .add(businessAddServiceModel.toFirebase());
  }

  //from firebase
  businessUserAddserviceFromFirebase(
      BusinessUserAddserviceModel businessAddServiceModel) async {
    final snapshot = await firebase
        .collection('BusinessUsers')
        .doc(businessUserModel.uid)
        .collection('Addservice')
        .get();
    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs
          .map((e) =>
              BusinessUserAddserviceModel.fromFirebase(firebase: e.data()))
          .toList();
    } else {
      log("in businessUserAddserviceFromFirebase() snapshot doesn't exist");
      return BusinessUserAddserviceModel();
    }
  }
}
