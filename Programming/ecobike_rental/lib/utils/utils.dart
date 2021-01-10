import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:ecobike_rental/entity/bike/double_bike.dart';
import 'package:ecobike_rental/entity/bike/electric_bike.dart';
import 'package:ecobike_rental/entity/bike/single_bike.dart';
import 'package:intl/intl.dart';

class Utils{
  static final dateFormat = DateFormat('yyyy-MM-dd hh:mm:ss');

  static String getToday(){
    final date = DateTime.now();
    return dateFormat.format(date);
  }

  static String generateMd5(String data) {
    final content = const Utf8Encoder().convert(data);
    final md5 = crypto.md5;
    final digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }



}