import 'package:http/http.dart' as http;
import 'package:ecomm_app/constants.dart';

class RemotePopularProductService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/popular-products';

  Future<dynamic> get() async {
    print('$remoteUrl?populate=product,product.images');
    var response = await client
        .get(Uri.parse('$remoteUrl?populate=product,product.images'));

    return response;
  }
}
