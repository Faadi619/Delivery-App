import 'package:app_876/Model/business_user_addservice_model.dart';
import 'package:app_876/service/firebase/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceAdditionViewModel extends ChangeNotifier {
  FirebaseServices firebaseServices = FirebaseServices();
  BusinessUserAddserviceModel businessAddServiceModel =
      BusinessUserAddserviceModel();

  TextEditingController serviceNameController = TextEditingController();
  TextEditingController serviceTimeController = TextEditingController();
  TextEditingController servicePriceController = TextEditingController();
  TextEditingController serviceDiscountController = TextEditingController();
  bool isChecked = false;
  bool isChecked2 = false;
  bool isLoading = false;

  paidAfterService(value) {
    isChecked = value;
    notifyListeners();
  }

  paidInAdvance(value) {
    isChecked2 = value;
    notifyListeners();
  }

  addService() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uid = prefs.getString('buid');
    businessAddServiceModel.serviceName = serviceNameController.text.trim();
    businessAddServiceModel.serviceTime = serviceTimeController.text.trim();
    businessAddServiceModel.servicePrice = servicePriceController.text.trim();
    businessAddServiceModel.serviceDescount =
        serviceDiscountController.text.trim();
    businessAddServiceModel.getPaidAfter = isChecked;
    businessAddServiceModel.gePaidInAdvance = isChecked2;
    businessAddServiceModel.uid = uid;
    notifyListeners();

    isLoading = true;
    notifyListeners();

    await firebaseServices
        .businessUserAddserviceToFirebase(businessAddServiceModel);
    //snackbar
    Get.snackbar(
      "Service Added",
      "Service Added Successfully",
    );
    isLoading = false;
    notifyListeners();
  }
}
