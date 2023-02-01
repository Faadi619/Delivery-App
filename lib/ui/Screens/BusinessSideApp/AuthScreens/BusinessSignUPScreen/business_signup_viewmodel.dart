import 'dart:developer';
import 'dart:io';

import 'package:app_876/Model/business_user_model.dart';
import 'package:app_876/service/firebase/firebase_services.dart';
import 'package:app_876/service/localDatabase/local_db.dart';
import 'package:app_876/ui/Screens/BusinessSideApp/AuthScreens/BusineesOTPVerificationScreen/BusinessOTPVerificationScreen.dart';
import 'package:app_876/ui/Screens/BusinessSideApp/AuthScreens/ServicesAdditionScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BusinessSignUpViewModel extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseServices firebase = FirebaseServices();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  String? imageURl;
  BusinessUserModel businessUserModel = BusinessUserModel();
  bool isLoading = false;
  bool loading = false;
  bool otpLoading = false;

  String? serviceCategoryBool;
  getServiceCategoryBool(String? value) {
    serviceCategoryBool = value;
    notifyListeners();
  }

  BusinessSignUpViewModel() {
    checkEmail();
  }

  final List<String> serviceCategoryList = [
    'Adult Bars Entertainment',
    'Architect',
    'Auto Mechanic',
    'Barbers',
    'Beautician',
    'Boutiques',
    'Construction',
    'Dentist',
    'Designer Stylist',
    'Doctors',
    'Gym',
    'Hair Stylist',
    'Hardware',
    'Hotels',
    'Message Therapist',
    'Night Club',
    'Personal Trainer',
    'Realtors',
  ];
  String? genderCategoryBool;
  getGenderBool(String? value) {
    genderCategoryBool = value;
    notifyListeners();
  }

  final List<String> genderList = [
    'Male',
    'Female',
  ];
  String? numberOfEmployeesBool;
  getNumberOfEmployeesBool(String? value) {
    numberOfEmployeesBool = value;
    notifyListeners();
  }

  final List<String> numberofEmployeesList = [
    '3-5',
    '6-10',
    '11-15',
    '16-20',
    '20-24',
  ];
  TextEditingController businessNoController = TextEditingController();
  TextEditingController businessPhoneNumberController = TextEditingController();
  TextEditingController businessEmailController = TextEditingController();
  TextEditingController businessWebsiteController = TextEditingController();
  TextEditingController businessDetailsController = TextEditingController();
  TextEditingController businessPasswordController = TextEditingController();

//image picker
  File? image;
  ImagePicker imagePicker = ImagePicker();
  pickImage(ImageSource imageSource) async {
    final img = await imagePicker.pickImage(source: imageSource);
    if (img != null) {
      image = File(img.path);
      notifyListeners();
    }
  }

//check if email is already in use
  List emailList = [];
  List phoneList = [];
  checkEmail() async {
    await FirebaseFirestore.instance
        .collection("BusinessUsers")
        .get()
        .then((value) async {
      value.docs.forEach((element) {
        phoneList.add(element.data()['phoneNumber']);
        emailList.add(element.data()['email']);

        notifyListeners();
      });
    });
    log("emailList $emailList");
  }

  //Otp Method>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Phone Authentication>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  phoneAuthentication() async {
    loading = true;
    notifyListeners();
    log("start loading $loading");
    log("in phoneAuthentication() ${businessPhoneNumberController.text}");
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: businessPhoneNumberController.text,
          timeout: const Duration(seconds: 120),
          verificationCompleted: (PhoneAuthCredential credential) async {
            loading = true;
            notifyListeners();
            //  await _auth
            //       .signInWithCredential(credential)
            //       .then((UserCredential credential) async {});
          },
          verificationFailed: (FirebaseAuthException exception) {
            loading = false;
            notifyListeners();
            Get.snackbar('Verification Failed', '${exception.message}',
                backgroundColor: Colors.red,
                colorText: Colors.white,
                duration: const Duration(seconds: 60),
                snackPosition: SnackPosition.BOTTOM);
          },
          codeSent: (String verificationId, int) {
            Get.to(() => BusinessOTPVerificationScreen(
                  phoneNumber: businessPhoneNumberController.text,
                  verificationId: verificationId,
                ));
          },
          codeAutoRetrievalTimeout: (String ver) {});
    } catch (e) {
      loading = false;
      notifyListeners();
      Get.snackbar('Error', 'OTP Verification Failed',
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 30),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }

    log("stop loading $loading");

    // return widget;
  }

//verify Otp Method>>>>>>>>>>>>>>>>
  Future<void> verifyOtp({
    required String verificationId,
    required String otp,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      otpLoading = true;
      notifyListeners();
      final credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp.trim());

      await auth
          .signInWithCredential(credential)
          .then((UserCredential credential) async {
        businessUserModel.uid = credential.user!.uid;
        notifyListeners();
        await businessUserDetail();
        // Get.to(LocationScreen());
        await Get.to(() => BusinessAddServicesScreen());
        otpLoading = false;
        notifyListeners();
        //add first screen data to firebase
      });
    } catch (e) {
      otpLoading = false;
      notifyListeners();
      log(e.toString());
      if (e ==
          "The sms code has expired. Please re-send the verification code to try again.") {
        Get.defaultDialog(
          title: "sms expired",
        );
      }
      Get.defaultDialog(
          title: "Worng OTP",
          content: const Text(
            "Your OTP is invaild.\n Please enter correct OTP",
            textAlign: TextAlign.center,
          ));
    }
  }

  //Image to firebase
  imageUrlToFirebase() async {
    try {
      final ref = _storage.ref().child(
          "UserSignUp/profileImages/${DateTime.now().microsecondsSinceEpoch}");
      //Upload the file to firebase
      final uploadTask1 = await ref.putFile(File(image!.path));
      //get url from firebase storage
      // Wait till the file is uploaded
      imageURl = await uploadTask1.ref.getDownloadURL();
      businessUserModel.image = imageURl;
      //assign url to appUser model

      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  //businessUserDetail Method>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  businessUserDetail() async {
    businessUserModel.businessName = businessNoController.text;
    businessUserModel.phoneNumber = businessPhoneNumberController.text;
    businessUserModel.email = businessEmailController.text;
    businessUserModel.website = businessWebsiteController.text;
    businessUserModel.registrationNumber = businessNoController.text;
    businessUserModel.gender = genderCategoryBool;
    businessUserModel.numberOfEmployees = numberOfEmployeesBool;
    businessUserModel.serviceCategory = serviceCategoryBool;
    businessUserModel.uid = _auth.currentUser!.uid;
    businessUserModel.password = businessPasswordController.text;
    await LocalDB.setBusinessUserRecord(
        email: businessUserModel.email!,
        password: businessUserModel.password!,
        uid: businessUserModel.uid!,
        name: businessUserModel.businessName);
    notifyListeners();
    try {
      // await imageUrlToFirebase();
      await firebase.businessUserToFirebase(businessUserModel);
      notifyListeners();
    } catch (e) {
      notifyListeners();
      log(e.toString());
    }
  }
}
