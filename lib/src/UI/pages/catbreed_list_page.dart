import 'dart:async';

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

    _scrollController.addListener(() {
      if (isActiveQuery == false &&
          context.read<CatbreedsListProvider>().noMoreResults == false &&
          _scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 500) {
        callNextPage(_scrollController.position.pixels);
        setState(() {});
      }
    });
  }

  Timer? _debounce;
  bool isActiveQuery = false;
  int currentPage = 0;

  TextEditingController _textController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  void callNextPage(double toPosition) async {
    setState(() {
      isActiveQuery = true;
    });

    currentPage++;

    await context.read<CatbreedsListProvider>().getNextCatbreeds(currentPage);

    setState(() {
      isActiveQuery = false;
      _scrollController.jumpTo(toPosition + 80);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 40,
          child: SearchBar(
            controller: _textController,
            hintText: 'Search for cat breeds',
            onChanged: (value) {
              //if (value.length > 0) {
              if (_debounce?.isActive ?? false) _debounce?.cancel();
              _debounce = Timer(const Duration(milliseconds: 500), () {
                context.read<CatbreedsListProvider>().searchCatbreeds(value);
                currentPage = 0;
              });
              //}
            },
            trailing: [
              IconButton(
                onPressed: () {
                  _textController.clear();
                  context.read<CatbreedsListProvider>().getCatbreeds();
                  currentPage = 0;
                },
                icon: const Icon(Icons.clear),
              )
            ],
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
                controller: _scrollController,
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
