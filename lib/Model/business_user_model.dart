class BusinessUserModel {
  String? image;
  String? serviceCategory;
  String? registrationNumber;
  String? businessName;
  String? gender;
  String? numberOfEmployees;
  String? phoneNumber;
  String? email;
  String? password;
  String? website;
  String? serviceDetails;
  String? uid;
  // String? serviceName;
  // String? serviceTime;
  // String? servicePrice;
  // String?
  BusinessUserModel(
      {this.image,
      this.serviceCategory,
      this.registrationNumber,
      this.businessName,
      this.gender,
      this.numberOfEmployees,
      this.uid,
      this.phoneNumber,
      this.email,
      this.password,
      this.serviceDetails,
      this.website});
  BusinessUserModel.Fromfirebase({firebase}) {
    image = firebase['image'];
    serviceCategory = firebase['serviceCategory'];
    registrationNumber = firebase['registrationNumber'];
    businessName = firebase["businessName"];
    gender = firebase["gender"];
    numberOfEmployees = firebase["numberOfEmployees"];
    phoneNumber = firebase["phoneNumber"];
    email = firebase["email"];
    password = firebase["password"];
    website = firebase["website"];
    uid = firebase["uid"];
    serviceDetails = firebase["serviceDetails"];
  }
  toFirebase() {
    return {
      "image": image,
      "serviceCategory": serviceCategory,
      "registrationNumber": registrationNumber,
      "businessName": businessName,
      "gender": gender,
      "numberOfEmployees": numberOfEmployees,
      "phoneNumber": phoneNumber,
      "email": email,
      "password": password,
      "website": website,
      "uid": uid,
      "serviceDetails": serviceDetails,
    };
  }
}
