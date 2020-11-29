import 'package:ecobike_rental/data/db/database.dart';
import 'package:equatable/equatable.dart';

class Rental extends Equatable implements Model {
  static String tableName = "Rentals";
  static String key = "rental_id";

  Rental({this.id, this.rateContent, this.rateNumber});

  Rental.empty();

  int id;
  int renterId;
  int bikeId;
  int cardId;
  String rateContent;
  double rateNumber;

  @override
  List<Object> get props => [id];

  @override
  Map<String, dynamic> toMap() {
    return {
      Rental.key: id,
      'renter_id': renterId,
      'bike_id': bikeId,
      'card_id': cardId,
      'rate_content': rateContent,
      'rate_number': rateNumber
    };
  }

  static Rental fromMap(Map<String, dynamic> map) {
    var rental = new Rental.empty();
    rental.id = map[Rental.key];
    rental.renterId = map["renter_id"];
    rental.bikeId = map["bike_id"];
    rental.cardId = map["card_id"];
    rental.rateContent = map["rate_content"];
    rental.rateNumber = map["rate_number"];
    return rental;
  }

  @override
  String getTableName() {
    return Rental.tableName;
  }
}
