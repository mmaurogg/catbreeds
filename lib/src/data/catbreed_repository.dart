import 'package:catbreeds/src/data/catbreed_api_source.dart';
import 'package:catbreeds/src/model/catbreed_model.dart';

abstract class CatbreedRepository {
  Future<List<CatbreedModel>?>? getCatbreeds();
  Future<List<CatbreedModel>?>? searchCatbreeds(String text);
  Future<List<CatbreedModel>?>? getNextCatbreeds(int page);
}

class CatbreedRepositoryImpl implements CatbreedRepository {
  final _catbreedApiSource = CatbreedApiSource();

  @override
  Future<List<CatbreedModel>?>? getCatbreeds() {
    return _catbreedApiSource.getCatbreeds();
  }

  @override
  Future<List<CatbreedModel>?>? searchCatbreeds(String text) {
    return _catbreedApiSource.searchCatbreeds(text);
  }

  @override
  Future<List<CatbreedModel>?>? getNextCatbreeds(int page) {
    return _catbreedApiSource.getNextCatbreeds(page);
  }
}
