import 'responses.dart';

class StationResponse {
  int stationId;
  int addressId;
  String stationName;
  String contactName;
  String email;
  String phone;
  double area;
  AddressResponse address;
  List<BikeResponse> listBike;

  StationResponse(
      {this.stationId,
      this.addressId,
      this.stationName,
      this.contactName,
      this.email,
      this.phone,
      this.area,
      this.address,
      this.listBike});

  StationResponse.fromJson(Map<String, dynamic> json) {
    stationId = json['stationId'];
    addressId = json['addressId'];
    stationName = json['stationName'];
    contactName = json['contactName'];
    email = json['email'];
    phone = json['phone'];
    area = json['area'];
    address = json['address'] != null
        ? AddressResponse.fromJson(json['address'])
        : null;
    if (json['listBike'] != null) {
      listBike = <BikeResponse>[];
      json['listBike'].forEach((v) {
        listBike.add(BikeResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['stationId'] = stationId;
    data['addressId'] = addressId;
    data['stationName'] = stationName;
    data['contactName'] = contactName;
    data['email'] = email;
    data['phone'] = phone;
    data['area'] = area;
    if (address != null) {
      data['address'] = address.toJson();
    }
    if (listBike != null) {
      data['listBike'] = listBike.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
