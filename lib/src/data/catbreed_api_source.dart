import 'package:catbreeds/src/model/catbreed_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CatbreedApiSource {
  final String _baseUrl = 'api.thecatapi.com';
  final String _endPoint = '/v1/breeds';
  final String _apiKey =
      'live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr';

  CatbreedApiSource();

  Future<List<CatbreedModel>?> getCatBreeds() async {
    final url = Uri.https(_baseUrl, _endPoint, {"limit": "10", "page": "0"});
    var response = await http.get(url, headers: {'x-api-key': _apiKey});

    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);

      final catbreedsResponse = (jsonResponse as List).map(
        (e) {
          return CatbreedModel.fromJson(e);
        },
      ).toList();

      return catbreedsResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
