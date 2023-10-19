import 'package:http/http.dart' as http;
import 'package:ecomm_app/constants.dart';

class RemoteBannerService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/v1/slider/all';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));

    return response;
  }
}
