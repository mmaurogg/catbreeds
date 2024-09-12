import 'package:catbreeds/src/data/catbreed_api_source.dart';
import 'package:catbreeds/src/model/catbreed_model.dart';

abstract class CatbreedRepository {
  Future<List<CatbreedModel>?> getCatbreeds();
  Future<List<CatbreedModel>?> searchCatbreeds(String text);
  Future<List<CatbreedModel>?> getNextCatBreeds(int page);
}

class CatbreedRepositoryImpl implements CatbreedRepository {
  final _catbreedApiSource = CatbreedApiSourceImpl();

  @override
  Future<List<CatbreedModel>?> getCatbreeds() {
    return _catbreedApiSource.getCatBreeds();
  }

  @override
  Future<List<CatbreedModel>?> searchCatbreeds(String text) {
    return _catbreedApiSource.searchCatBreeds(text);
  }

  @override
  Future<List<CatbreedModel>?> getNextCatBreeds(int page) {
    return _catbreedApiSource.getNextCatBreeds(page);
  }
}
