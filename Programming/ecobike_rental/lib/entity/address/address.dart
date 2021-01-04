import 'dart:math';

class Address {
  Address({this.addressName, this.longitude, this.latitude});

  Address.fromJson(Map<String, dynamic> json) {
    addressName = json['addressName'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['addressName'] = addressName;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }

  String addressName;
  int longitude;
  int latitude;

  static double calculateDistance(Address startPosision, Address endPosision){
    return sqrt(pow(endPosision.latitude - startPosision.latitude, 2) + pow(endPosision.longitude - startPosision.longitude, 2));
  }
}
