import 'responses.dart';

class RentalResponse {
  RentalResponse({
    this.bike,
    this.transaction,
  });

  RentalResponse.fromJson(Map<String, dynamic> json) {
    bike = json['bike'] != null ? BikeResponse.fromJson(json['bike']) : null;
    transaction = json['transaction'] != null
        ? TransactionResponse.fromJson(json['transaction'])
        : null;
  }

  BikeResponse bike;
  TransactionResponse transaction;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (bike != null) {
      data['bike'] = bike.toJson();
    }

    if (transaction != null) {
      data['transaction'] = transaction.toJson();
    }
    return data;
  }
}
