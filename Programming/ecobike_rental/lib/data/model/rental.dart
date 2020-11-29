import 'package:equatable/equatable.dart';

import '../db/database.dart';

class Rental extends Equatable implements Model {
  Rental({this.id, this.rateContent, this.rateNumber});

  Rental.empty();

  Rental.fromMap(Map<String, dynamic> map) {
    id = map[Rental.key];
    renterId = map["renter_id"];
    bikeId = map["bike_id"];
    cardId = map["card_id"];
    rateContent = map["rate_content"];
    rateNumber = map["rate_number"];
  }

  static String tableName = "Rentals";
  static String key = "rental_id";

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

  @override
  String getTableName() {
    return Rental.tableName;
  }
}
