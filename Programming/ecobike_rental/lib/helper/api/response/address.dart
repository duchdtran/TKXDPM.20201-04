class AddressResponse {
  String addressName;
  int longitude;
  int latitude;

  AddressResponse({this.addressName, this.longitude, this.latitude});

  AddressResponse.fromJson(Map<String, dynamic> json) {
    addressName = json['addressName'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressName'] = this.addressName;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}
