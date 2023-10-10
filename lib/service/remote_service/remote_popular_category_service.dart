import 'package:http/http.dart' as http;
import 'package:ecomm_app/constants.dart';

class RemotePopularCategoryService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/v1/metals/all';

  Future<dynamic> get() async {
    print(remoteUrl);
    var response = await client.get(Uri.parse(remoteUrl));
    print("response: -> $response");
    return response;
  }
}
