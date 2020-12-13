import '../core/cores.dart';
import '../service/network/response/responses.dart';

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
      case 1:
        bike = SingleBike(
          bikeName: response.bikeName,
          costHourlyRent: response.hourlyRent,
          costStartingRent: response.startingRent,
          deposits: response.deposit,
          description: response.description,
          id: response.bikeId,
          isRented: response.rentals == '',
          //images: [response.image],
          bikeType: response.type,
          licensePlates: response.licensePlates,
        );
        break;
      case 2:
        bike = DoubleBike(
          bikeName: response.bikeName,
          costHourlyRent: response.hourlyRent,
          costStartingRent: response.startingRent,
          deposits: response.deposit,
          description: response.description,
          id: response.bikeId,
          isRented: response.rentals == '',
          //images: [response.image],
          bikeType: response.type,
          licensePlates: response.licensePlates,
        );
        break;
      case 3:
        bike = ElectricBike(
          batteryCapacity: response.batterCapacity,
          powerDrain: response.powerDrain, bikeName: response.bikeName,
          costHourlyRent: response.hourlyRent,
          costStartingRent: response.startingRent,
          deposits: response.deposit,
          description: response.description,
          isRented: response.rentals == '',
          id: response.bikeId,
          //images: [response.image],
          bikeType: response.type,
          licensePlates: response.licensePlates,
        );
        break;
    }
    return bike;
  }

  static Transaction convertTransactionResponse(TransactionResponse response) {
    if(response == null){
      return null;
    }
    return Transaction(
      actualEndDateTime: response.actualEndDateTime,
      actualStartDateTime: response.actualStartDateTime,
      bookedEndDateTime: response.bookedEndDateTime,
      bookedStartDateTime: response.bookedStartDateTime,
      paymentStutus: response.paymentStatus,
    );
  }

  static Rental convertRentalResponse(RentalResponse response) {
    return Rental(
      rentedBike: convertBikeResponse(response.bike),
      transactionInfo: convertTransactionResponse(response.transaction),
    );
  }
}
