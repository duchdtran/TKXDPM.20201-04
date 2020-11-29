import '../db/database.dart';
import 'models.dart';

class Card implements Model {
  Card({
    this.id,
    this.cardCode,
    this.owner,
    this.cvvCode,
    this.dateExpired,
    this.paymentMethod,
  });

  Card.empty();

  Card.fromMap(Map<String, dynamic> map) {
    id = map[Card.key];
    renderId = map['renter_id'];
    paymentMethod = map['payment_method'];
    cvvCode = map['cvv'];
    dateExpired = map['expiration_date'];
  }

  static String tableName = "Card";
  static String key = "card_id";
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

  @override
  String getTableName() {
    return Card.tableName;
  }
}
