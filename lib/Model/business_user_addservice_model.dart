class BusinessUserAddserviceModel {
  BusinessUserAddserviceModel({
    this.serviceName,
    this.servicePrice,
    this.serviceTime,
    this.serviceDescount,
    this.getPaidAfter,
    this.gePaidInAdvance,
    this.uid,
  });

  String? serviceName;
  String? servicePrice;
  String? serviceDescount;
  String? serviceTime;
  bool? getPaidAfter;
  bool? gePaidInAdvance;
  String? uid;
  BusinessUserAddserviceModel.fromFirebase({firebase}) {
    serviceName = firebase['serviceName'] ?? '';
    servicePrice = firebase['servicePrice'] ?? '';
    serviceDescount = firebase['serviceDescount'] ?? '';
    serviceTime = firebase['serviceTime'] ?? '';
    getPaidAfter = firebase['getPaidAfter'] ?? false;
    gePaidInAdvance = firebase['gePaidInAdvance'] ?? false;
    uid = firebase['uid'] ?? '';
  }

  toFirebase() {
    return {
      "serviceName": serviceName ?? '',
      "servicePrice": servicePrice ?? '',
      "serviceDescount": serviceDescount ?? '',
      "serviceTime": serviceTime ?? '',
      "getPaidAfter": getPaidAfter ?? false,
      "gePaidInAdvance": gePaidInAdvance ?? false,
      "uid": uid ?? '',
    };
  }
}
