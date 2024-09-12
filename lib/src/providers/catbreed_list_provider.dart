import 'package:catbreeds/src/data/catbreed_repository.dart';
import 'package:flutter/material.dart';
import 'package:catbreeds/src/model/catbreed_model.dart';
import 'package:rxdart/rxdart.dart';

class CatbreedsListProvider extends ChangeNotifier {
  final CatbreedRepositoryImpl _catbreedRepository;

  CatbreedsListProvider(this._catbreedRepository);

  List<CatbreedModel> catbreedList = [];

  final _catbreedListSubject = BehaviorSubject<List<CatbreedModel>>();

  ValueStream<List<CatbreedModel>> get catbreedListStream =>
      _catbreedListSubject.stream;

  bool noMoreResults = false;

  Future<void> getCatbreeds() async {
    var list = await _catbreedRepository.getCatbreeds();
    if (list != null) catbreedList = list;
    _catbreedListSubject.value = catbreedList;
    notifyListeners();
  }

  Future<void> getNextCatbreeds(int page) async {
    var list = await _catbreedRepository.getNextCatbreeds(page);
    if (list != null && list.isNotEmpty) {
      catbreedList.addAll(list);
    } else {
      noMoreResults = true;
    }
    _catbreedListSubject.value = catbreedList;
    notifyListeners();
  }

  Future<void> searchCatbreeds(String text) async {
    var list = await _catbreedRepository.searchCatbreeds(text);
    if (list != null) catbreedList = list;
    _catbreedListSubject.value = catbreedList;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _catbreedListSubject.close();
  }
}
