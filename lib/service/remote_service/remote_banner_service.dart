import 'package:http/http.dart' as http;
import 'package:ecomm_app/constants.dart';

class RemoteBannerService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/v1/gallery/album/4715b8f0-9570-405e-ae3d-f144792a7225';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));

    return response;
  }
}
