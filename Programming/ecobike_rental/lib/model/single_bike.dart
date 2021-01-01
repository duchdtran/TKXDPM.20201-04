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
}
