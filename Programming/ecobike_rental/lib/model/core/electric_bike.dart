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
  double powerDrain;
}
