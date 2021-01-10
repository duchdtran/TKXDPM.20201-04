import 'bike.dart';

class DoubleBike extends Bike {
  static const int BIKE_TYPE = 2;

  DoubleBike({
    id,
    bikeName,
    description,
    size,
    images,
    isRented,
    costStartingRent,
    costHourlyRent,
    bikeType,
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

  DoubleBike.fromJson(Map<String, dynamic> json) {
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
}
