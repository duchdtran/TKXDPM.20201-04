class BikeResponse {
  int bikeId;
  String bikeName;
  String description;
  int startingRent;
  int hourlyRent;
  int type;
  String licensePlates;
  int batterCapacity;
  double powerDrain;
  int deposit;
  String rentals;

  BikeResponse(
      {this.bikeId,
      this.bikeName,
      this.description,
      this.startingRent,
      this.hourlyRent,
      this.type,
      this.licensePlates,
      this.batterCapacity,
      this.powerDrain,
      this.deposit,
      this.rentals});

  BikeResponse.fromJson(Map<String, dynamic> json) {
    bikeId = json['bikeId'];
    bikeName = json['bikeName'];
    description = json['description'];
    startingRent = json['startingRent'];
    hourlyRent = json['hourlyRent'];
    type = json['type'];
    licensePlates = json['licensePlates'];
    batterCapacity = json['batterCapacity'];
    powerDrain = json['powerDrain'];
    deposit = json['deposit'];
    rentals = json['rentals'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bikeId'] = this.bikeId;
    data['bikeName'] = this.bikeName;
    data['description'] = this.description;
    data['startingRent'] = this.startingRent;
    data['hourlyRent'] = this.hourlyRent;
    data['type'] = this.type;
    data['licensePlates'] = this.licensePlates;
    data['batterCapacity'] = this.batterCapacity;
    data['powerDrain'] = this.powerDrain;
    data['deposit'] = this.deposit;
    data['rentals'] = this.rentals;
    return data;
  }
}
