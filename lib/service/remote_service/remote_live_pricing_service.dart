import 'package:ecomm_app/constants.dart';
import 'package:http/http.dart' as http;

class RemoteLivePricingService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/v1/pricing/live/';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));
    print(response.statusCode);
    print(response.body);
    return response;
  }
}