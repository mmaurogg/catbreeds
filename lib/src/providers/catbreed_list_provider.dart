import 'package:catbreeds/src/data/catbreed_repository.dart';
import 'package:flutter/material.dart';
import 'package:catbreeds/src/model/catbreed_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class CatbreedsListProvider extends ChangeNotifier {
  final _catbreedRepository = CatbreedRepositoryImpl();

  List<CatbreedModel> catbreedList = [];

  CatbreedsListProvider();

  final _catbreedListSubject = BehaviorSubject<List<CatbreedModel>>();

  ValueStream<List<CatbreedModel>> get catbreedListStream =>
      _catbreedListSubject.stream;

  Future<void> getCatbreeds() async {
    var list = await _catbreedRepository.getCatbreeds();
    if (list != null) catbreedList = list;
    _catbreedListSubject.value = catbreedList;
    notifyListeners();
  }

  Future<void> getNextCatbreeds(int page) async {
    var list = await _catbreedRepository.getCatbreeds();
    if (list != null) catbreedList.addAll(list);
    _catbreedListSubject.value = catbreedList;
    notifyListeners();
  }

  Future<void> searchCatbreeds(String text) async {
    var list = await _catbreedRepository.searchCatbreeds(text);
    if (list != null) catbreedList = list;
    _catbreedListSubject.value = catbreedList;
    notifyListeners();
  }
}
