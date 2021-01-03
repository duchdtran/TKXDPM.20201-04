
import '../../common/exception/unrecognized.dart';
import '../../utils/api.dart';

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