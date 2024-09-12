import 'package:catbreeds/src/data/catbreed_repository.dart';
import 'package:catbreeds/src/model/catbreed_model.dart';
import 'package:catbreeds/src/providers/catbreed_list_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCatbreedRepository extends Mock implements CatbreedRepositoryImpl {}

void main() {
  late CatbreedsListProvider provider;
  late MockCatbreedRepository repository;

  setUp(() {
    repository = MockCatbreedRepository();

    provider = CatbreedsListProvider(repository);
  });

  test(
    'getCatbreeds() shoud stream List<CatbreedModel>',
    () async {
      var response = <CatbreedModel>[
        CatbreedModel(id: '1', name: 'Abyssinian'),
      ];

      when(repository.getCatbreeds()).thenAnswer((_) => Future.value(response));

      provider.catbreedListStream.listen(
        (value) {
          expect(value, response);
          expect(value, isA<List<CatbreedModel>>());
        },
      );

      await provider.getCatbreeds();

      verify(repository.getCatbreeds());
    },
  );

  test(
    'getNextCatbreeds(int page) shoud stream List<CatbreedModel>',
    () async {
      var response = <CatbreedModel>[
        CatbreedModel(id: '2', name: 'Aegean'),
      ];

      when(repository.getNextCatbreeds(1))
          .thenAnswer((_) => Future.value(response));

      provider.catbreedListStream.listen(
        (value) {
          expect(value, response);
          expect(value, isA<List<CatbreedModel>>());
        },
      );

      await provider.getNextCatbreeds(1);

      verify(repository.getNextCatbreeds(1));
    },
  );

  test(
    'searchCatbreeds(String text) shoud stream List<CatbreedModel>',
    () async {
      var response = <CatbreedModel>[
        CatbreedModel(id: '2', name: 'Aegean'),
      ];

      when(repository.searchCatbreeds('Aegean'))
          .thenAnswer((_) => Future.value(response));

      provider.catbreedListStream.listen(
        (value) {
          expect(value, response);
          expect(value, isA<List<CatbreedModel>>());
        },
      );

      await provider.searchCatbreeds('Aegean');

      verify(repository.searchCatbreeds('Aegean'));
    },
  );
}
