import 'package:ecobike_rental/data/db/database.dart';
import 'package:ecobike_rental/data/model/models.dart';

class Card implements Model {
  static String tableName = "Card";
  static String key = "card_id";

  Card({
    this.id,
    this.cardCode,
    this.owner,
    this.cvvCode,
    this.dateExpired,
    this.paymentMethod,
  });

  Card.empty();

  int id;
  String paymentMethod;
  String cardCode;
  String owner;
  int renderId;
  Renter renter;
  int cvvCode;
  String dateExpired;

  @override
  Map<String, dynamic> toMap() {
    return {
      Card.key: id,
      'renter_id': renderId,
      'payment_method': paymentMethod,
      'cvv': cvvCode,
      'expiration_date': dateExpired
    };
  }

  static Card fromMap(Map<String, dynamic> map) {
    var card = new Card.empty();
    card.id = map[Card.key];
    card.renderId = map['renter_id'];
    card.paymentMethod = map['payment_method'];
    card.cvvCode = map['cvv'];
    card.dateExpired = map['expiration_date'];
    return card;
  }

  @override
  String getTableName() {
    return Card.tableName;
  }
}
