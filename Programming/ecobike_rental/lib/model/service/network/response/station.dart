import 'responses.dart';

class StationResponse {
  int stationId;
  int addressId;
  String stationName;
  String stationImage;
  String contactName;
  String email;
  String phone;
  int area;
  AddressResponse address;
  List<BikeResponse> listBike;

  StationResponse(
      {this.stationId,
      this.addressId,
      this.stationName,
      this.stationImage,
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
    stationImage = json['stationImage'];
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stationId'] = this.stationId;
    data['addressId'] = this.addressId;
    data['stationName'] = this.stationName;
    data['stationImage'] = this.stationImage;
    data['contactName'] = this.contactName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['area'] = this.area;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    if (this.listBike != null) {
      data['listBike'] = this.listBike.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
