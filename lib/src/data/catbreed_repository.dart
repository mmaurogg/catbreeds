import 'package:catbreeds/src/data/catbreed_api_source.dart';
import 'package:catbreeds/src/model/catbreed_model.dart';

abstract class CatbreedRepository {
  Future<List<CatbreedModel>?> getCatbreeds();
}

class CatbreedRepositoryImpl implements CatbreedRepository {
  final _catbreedApiSource = CatbreedApiSource();

  @override
  Future<List<CatbreedModel>?> getCatbreeds() {
    return _catbreedApiSource.getCatBreeds();
  }
}
