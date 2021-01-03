import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
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