import '../../model/address.dart';
import '../../model/bike.dart';
import '../../model/double_bike.dart';
import '../../model/electric_bike.dart';
import '../../model/single_bike.dart';
import '../../model/station.dart';
import '../api/response/responses.dart';

class Converter {
  static Station convertStationResponse(StationResponse response) {
    if(response == null){
      return null;
    }
    final bikes = <Bike>[];
    response.listBike
        .forEach((element) => bikes.add(convertBikeResponse(element)));
    return Station(
      address: convertAddressResponse(response.address),
      area: response.area,
      contactName: response.contactName,
      bikes: bikes,
      image: response.stationImage,
      id: response.stationId,
      stationName: response.stationName,
      email: response.email,
      phone: response.phone,
    );
  }

  static Address convertAddressResponse(AddressResponse response) {
    if(response == null){
      return null;
    }
    return Address(
      addressName: response.addressName,
      latitude: response.latitude,
      longitude: response.longitude,
    );
  }

  static Bike convertBikeResponse(BikeResponse response) {
    if(response == null){
      return null;
    }
    Bike bike;
    switch (response.type) {
      case Bike.SINGLE_BIKE:
        bike = SingleBike(
          bikeName: response.bikeName,
          costHourlyRent: response.hourlyRent,
          costStartingRent: response.startingRent,
          deposits: response.deposit,
          description: response.description,
          id: response.bikeId,
          isRented: response.rentals == '',
          images: [response.bikeImage],
          bikeType: response.type,
          licensePlates: response.licensePlates,
        );
        break;
      case Bike.DOUBLE_BIKE:
        bike = DoubleBike(
          bikeName: response.bikeName,
          costHourlyRent: response.hourlyRent,
          costStartingRent: response.startingRent,
          deposits: response.deposit,
          description: response.description,
          id: response.bikeId,
          isRented: response.rentals == '',
          images: [response.bikeImage],
          bikeType: response.type,
          licensePlates: response.licensePlates,
        );
        break;
      case Bike.ELECTRIC_BIKE:
        bike = ElectricBike(
          batteryCapacity: response.batterCapacity,
          powerDrain: response.powerDrain, bikeName: response.bikeName,
          costHourlyRent: response.hourlyRent,
          costStartingRent: response.startingRent,
          deposits: response.deposit,
          description: response.description,
          isRented: response.rentals == '',
          id: response.bikeId,
          images: [response.bikeImage],
          bikeType: response.type,
          licensePlates: response.licensePlates,
        );
        break;
    }
    return bike;
  }

}
