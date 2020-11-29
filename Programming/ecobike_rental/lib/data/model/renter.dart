import 'package:ecobike_rental/data/db/database.dart';
import 'package:equatable/equatable.dart';

class Renter extends Equatable implements Model {
  static String tableName = "Renter";
  static String key = "renter_id";

  Renter({this.id, this.name});

  Renter.empty();

  int id;
  String name;

  @override
  List<Object> get props => [id];

  @override
  Map<String, dynamic> toMap() {
    return {
      Renter.key: id,
      'renter_name': name,
    };
  }

  static Renter fromMap(Map<String, dynamic> map) {
    var renter = Renter.empty();
    renter.id = map[Renter.key];
    renter.name = map["renter_name"];
    return renter;
  }

  @override
  String getTableName() {
    return Renter.tableName;
  }
}
