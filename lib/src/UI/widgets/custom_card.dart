import 'package:catbreeds/src/UI/pages/card_detail_page.dart';
import 'package:catbreeds/src/model/catbreed_model.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.catType});

  final CatbreedModel catType;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CardDetailPage(
                  catType: catType,
                )));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Raza: " + catType.name!),
                  Text('Más...'),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Image.network(
                  catType.image!.url!,
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Origen: " + catType.origin!),
                  Text("Inteligencia: " + catType.intelligence!.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
