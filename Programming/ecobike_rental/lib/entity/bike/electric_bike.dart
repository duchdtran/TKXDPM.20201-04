import 'bike.dart';

class ElectricBike extends Bike {
  ElectricBike({
    this.batteryCapacity,
    this.powerDrain,
    id,
    bikeName,
    description,
    size,
    isRented,
    costStartingRent,
    costHourlyRent,
    bikeType,
    images,
    licensePlates,
    deposits,
  }) : super(
          bikeName: bikeName,
          id: id,
          bikeType: bikeType,
          costHourlyRent: costHourlyRent,
          costStartingRent: costStartingRent,
          deposits: deposits,
          description: description,
          isRented: isRented,
          images: images,
          licensePlates: licensePlates,
          size: size,
        );

  int batteryCapacity;
  int powerDrain;

  ElectricBike.fromJson(Map<String, dynamic> json) {
    id = json['bikeId'];
    bikeName = json['bikeName'];
    description = json['description'];
    costStartingRent = json['startingRent'];
    costHourlyRent = json['hourlyRent'];
    bikeType = json['type'];
    images = [json['bikeImage']];
    licensePlates = json['licensePlates'];
    deposits = json['deposit'];
    isRented = json['isRented'];
  }

  @override
  Map<String, dynamic> toJson() {
    final  data =  <String, dynamic>{};
    data['bikeId'] = id;
    data['bikeName'] = bikeName;
    data['description'] = description;
    data['startingRent'] = costStartingRent;
    data['hourlyRent'] = costHourlyRent;
    data['bikeImage'] = images[0];
    data['type'] = bikeType;
    data['licensePlates'] = licensePlates;
    data['deposit'] = deposits;
    data['isRented'] = isRented;
    return data;
  }
}
