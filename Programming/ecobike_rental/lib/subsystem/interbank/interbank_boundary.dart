
import '../../common/exception/unrecognized.dart';
import '../../ultils/api.dart';

class InterbankBoundary{
  Future<String> query(String url, String data) async{
    String response;
    try{
      response = await API.patch(url, data);
    } on Exception {
      throw UnrecognizedException();
    }
    return Future.value(response);
  }
}