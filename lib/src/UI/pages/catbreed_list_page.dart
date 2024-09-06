import 'package:catbreeds/src/UI/widgets/custom_card.dart';
import 'package:catbreeds/src/model/catbreed_model.dart';
import 'package:catbreeds/src/providers/catbreed_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatbreedListPage extends StatefulWidget {
  const CatbreedListPage({super.key});

  @override
  State<CatbreedListPage> createState() => _CatbreedListPageState();
}

class _CatbreedListPageState extends State<CatbreedListPage> {
  CatbreedsListProvider? catbreedProvider;

  @override
  void initState() {
    super.initState();
    //catbreedProvider = Provider.of<CatbreedsListProvider>(context);
    context.read<CatbreedsListProvider>().getCatbreeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          height: 40,
          child: SearchBar(
            hintText: 'Search for cat breeds',
          ),
        ),
      ),
      body: Scrollbar(
        child: StreamBuilder<List<CatbreedModel>>(
            stream: context.watch<CatbreedsListProvider>().catbreedListStream,
            initialData: [],
            builder: (context, snapshotCatbreedsList) {
              if (snapshotCatbreedsList.data!.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: snapshotCatbreedsList.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title:
                        CustomCard(catType: snapshotCatbreedsList.data![index]),
                  );
                },
              );
            }),
      ),
    );
  }
}
