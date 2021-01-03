import 'dart:convert';

import '../../utils/api.dart';

class Invoice {
  Invoice({this.fee, this.minutes});

    Invoice.fromJson(Map<String, dynamic> json) {
    fee = json['fee'];
    minutes = json['minutes'];
  }

  Map<String, dynamic> toJson() {
    final  data =  <String, dynamic>{};
    data['fee'] = fee;
    data['minutes'] = minutes;
    return data;
  }

  int fee;
  int minutes;

  Future<Invoice> getInvoice(String deviceCode, int bikeId) async{
    Invoice invoice;
    final url = 'https://tkxdpm-server.herokuapp.com/api/get-invoice?deviceCode=$deviceCode&bikeId=$bikeId';
    final response = await API.get(url);
    invoice = Invoice.fromJson(json.decode(response));

    return Future.value(invoice);
  }
}
