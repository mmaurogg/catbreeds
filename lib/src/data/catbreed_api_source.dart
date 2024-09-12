import 'package:catbreeds/src/data/api_source.dart';
import 'package:catbreeds/src/model/catbreed_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

abstract class CatbreedApiSource {
  Future<List<CatbreedModel>?> getCatBreeds();
  Future<List<CatbreedModel>?> getNextCatBreeds(int page);
  Future<List<CatbreedModel>?> searchCatBreeds(String text);
}

class CatbreedApiSourceImpl extends ApiSource implements CatbreedApiSource {
  CatbreedApiSourceImpl()
      : super(
          client: http.Client(),
          conectivity: null,
          token:
              'live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr',
        );

  final String _baseUrl = 'api.thecatapi.com';

  final String _apiKey =
      'live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr';

  @override
  Future<List<CatbreedModel>?> getCatbreeds() async {
    const String endPoint = '/v1/breeds';
    final url = Uri.https(_baseUrl, endPoint, {"limit": "10", "page": "0"});

    return await getApi(url).then((response) {
      print("object");

      /* if (response.statusCode == 200) {
        final jsonResponse = convert.jsonDecode(response.body);

        final catbreedsResponse = (jsonResponse as List).map(
          (e) {
            return CatbreedModel.fromJson(e);
          },
        ).toList();

        return catbreedsResponse;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      } */
    });

    /* 
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
    } */
  }

  Future<List<CatbreedModel>?> getNextCatbreeds(int page) async {
    const String _endPoint = '/v1/breeds';
    final url = Uri.https(
        _baseUrl, _endPoint, {"limit": "10", "page": page.toString()});
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

  Future<List<CatbreedModel>?> searchCatbreeds(String text) async {
    const String _endPoint = '/v1/breeds/search';
    final url = Uri.https(_baseUrl, _endPoint, {"q": text});
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
