import 'bike.dart';

class SingleBike extends Bike {
  SingleBike({
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
          isRented: isRented,
          description: description,
          images: images,
          licensePlates: licensePlates,
          size: size,
        );

  SingleBike.fromJson(Map<String, dynamic> json) {
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
