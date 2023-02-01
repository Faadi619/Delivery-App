import 'package:app_876/Model/CustomerUser/customer_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerFirebaseService {
  CustomerUserModel customerUserModel = CustomerUserModel();
  final FirebaseFirestore firebase = FirebaseFirestore.instance;

  customerToFirebase(CustomerUserModel customerUserModel1) async {
    await firebase
        .collection('CustomerUsers')
        .doc(customerUserModel1.uid)
        .set(customerUserModel1.toFirebase());
  }

  //to firebase
  customerFromFirebase(CustomerUserModel customerUserModel1) async {
    final snapshot = await firebase
        .collection('CustomerUsers')
        .doc(customerUserModel1.uid)
        .get();
    if (snapshot.exists) {
      return CustomerUserModel.fromFirebase(firebase: snapshot.data());
    } else {
      print("in customerFromFirebase() snapshot doesn't exist");
      return CustomerUserModel();
    }
  }
}
