class CustomerUserModel {
  String? image;
  String? name;
  String? email;
  String? gender;
  String? phoneNumber;
  String? password;
  String? uid;

  CustomerUserModel(
      {this.name,
      this.image,
      this.email,
      this.gender,
      this.phoneNumber,
      this.password,
      this.uid});

  CustomerUserModel.fromFirebase({firebase}) {
    image = firebase["image"] ?? "";
    name = firebase['name'] ?? '';
    email = firebase["email"] ?? "";
    gender = firebase["gender"] ?? "";
    phoneNumber = firebase["phoneNumber"] ?? "";
    password = firebase["password"] ?? "";
    uid = firebase["uid"] ?? "";
  }
  toFirebase() {
    return {
      "image": image ?? "",
      "name": name ?? '',
      "email": email ?? "",
      "gender": gender ?? "",
      "phoneNumber": phoneNumber ?? "",
      "password": password ?? "",
      "uid": uid ?? "",
    };
  }
}
