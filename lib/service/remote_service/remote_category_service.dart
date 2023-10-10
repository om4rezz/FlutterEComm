import 'package:ecomm_app/constants.dart';
import 'package:http/http.dart' as http;

class RemoteCategoryService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/v1/metals/all';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));
    print("response:-> $response");
    return response;
  }
}
