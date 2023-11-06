import 'package:http/http.dart' as http;
import 'package:ecomm_app/constants.dart';

class RemoteProductService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/v1/products/all';

  Future<dynamic> get() async {
    var response = await client.get(
      Uri.parse(remoteUrl),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "accept": "application/json; charset=UTF-8"
      },
    );

    return response;
  }

  Future<dynamic> getByName({required String keyword}) async {
    var response = await client.get(
      Uri.parse(remoteUrl),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "accept": "application/json; charset=UTF-8"
      },
    );

    return response;
  }

  Future<dynamic> getByCategory({required String id}) async {
    var response = await client.get(
      Uri.parse(remoteUrl),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "accept": "application/json; charset=UTF-8"
      },
    );

    return response;
  }
}
