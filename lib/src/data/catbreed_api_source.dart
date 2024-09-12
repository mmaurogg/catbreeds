import 'package:catbreeds/src/data/api_source.dart';
import 'package:catbreeds/src/model/catbreed_model.dart';

abstract class CatbreedApiSource {
  Future<List<CatbreedModel>?> getCatbreeds();
  Future<List<CatbreedModel>?> getNextCatbreeds(int page);
  Future<List<CatbreedModel>?> searchCatbreeds(String text);
}

class CatbreedApiSourceImpl extends ApiSource implements CatbreedApiSource {
  CatbreedApiSourceImpl()
      : super(
          token:
              'live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr',
        );

  final String _baseUrl = 'api.thecatapi.com';

  @override
  Future<List<CatbreedModel>?> getCatbreeds() async {
    const String endPoint = '/v1/breeds';
    final url = Uri.https(_baseUrl, endPoint, {"limit": "10", "page": "0"});

    return await getApi(url).then((jsonResponse) {
      print("object");

      final catbreedsResponse = (jsonResponse as List).map(
        (e) {
          return CatbreedModel.fromJson(e);
        },
      ).toList();

      return catbreedsResponse;
    });
  }

  @override
  Future<List<CatbreedModel>?> getNextCatbreeds(int page) async {
    const String _endPoint = '/v1/breeds';
    final url = Uri.https(
        _baseUrl, _endPoint, {"limit": "10", "page": page.toString()});

    return await getApi(url).then((jsonResponse) {
      final catbreedsResponse = (jsonResponse as List).map(
        (e) {
          return CatbreedModel.fromJson(e);
        },
      ).toList();

      return catbreedsResponse;
    });
  }

  @override
  Future<List<CatbreedModel>?> searchCatbreeds(String text) async {
    const String _endPoint = '/v1/breeds/search';
    final url = Uri.https(_baseUrl, _endPoint, {"q": text});

    return await getApi(url).then((jsonResponse) {
      final catbreedsResponse = (jsonResponse as List).map(
        (e) {
          return CatbreedModel.fromJson(e);
        },
      ).toList();

      return catbreedsResponse;
    });
  }
}
