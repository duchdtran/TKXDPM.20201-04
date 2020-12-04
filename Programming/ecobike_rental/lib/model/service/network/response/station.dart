class StationResponse {
  String contactName;
  String email;
  String phone;
  int area;
  AddressResponse address;
  List<BikeResponse> listBike;

  StationResponse(
      {this.contactName,
      this.email,
      this.phone,
      this.area,
      this.address,
      this.listBike});

  StationResponse.fromJson(Map<String, dynamic> json) {
    contactName = json['contactName'];
    email = json['email'];
    phone = json['phone'];
    area = json['area'];
    address = json['address'] != null
        ? new AddressResponse.fromJson(json['address'])
        : null;
    if (json['listBike'] != null) {
      listBike = new List<BikeResponse>();
      json['listBike'].forEach((v) {
        listBike.add(new BikeResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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

class BikeResponse {
  String bikeName;
  String description;
  int startingRent;
  int hourlyRent;
  int type;
  String licensePlates;
  int batterCapacity;
  double powerDrain;
  int deposit;

  BikeResponse(
      {this.bikeName,
      this.description,
      this.startingRent,
      this.hourlyRent,
      this.type,
      this.licensePlates,
      this.batterCapacity,
      this.powerDrain,
      this.deposit});

  BikeResponse.fromJson(Map<String, dynamic> json) {
    bikeName = json['bikeName'];
    description = json['description'];
    startingRent = json['startingRent'];
    hourlyRent = json['hourlyRent'];
    type = json['type'];
    licensePlates = json['licensePlates'];
    batterCapacity = json['batterCapacity'];
    powerDrain = json['powerDrain'];
    deposit = json['deposit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bikeName'] = this.bikeName;
    data['description'] = description;
    data['startingRent'] = startingRent;
    data['hourlyRent'] = this.hourlyRent;
    data['type'] = this.type;
    data['licensePlates'] = this.licensePlates;
    data['batterCapacity'] = this.batterCapacity;
    data['powerDrain'] = this.powerDrain;
    data['deposit'] = this.deposit;
    return data;
  }
}
