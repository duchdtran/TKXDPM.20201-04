import 'bike.dart';

class DoubleBike extends Bike {
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
}
