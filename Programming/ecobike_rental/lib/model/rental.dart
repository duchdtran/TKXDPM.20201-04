import 'bike.dart';
import 'renter.dart';
import 'transaction.dart';

class Rental {
  Rental({this.rentedBike, this.renter, this.transactionInfo});
  Renter renter;
  Bike rentedBike;
  Transaction transactionInfo;
}
