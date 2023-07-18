import 'package:http/http.dart' as http;
import 'package:ecomm_app/constants.dart';

class RemotePopularCategoryService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/popular-categories';

  Future<dynamic> get() async {
    print(
        '$remoteUrl?populate=category,category.image&pagination[start]=0&pagination[limit]=5');
    var response = await client.get(Uri.parse(
        '$remoteUrl?populate=category,category.image&pagination[start]=0&pagination[limit]=5'));

    return response;
  }
}
