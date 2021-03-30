import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plants_shop/screens/home_screen/components/card_ui.dart';
import 'package:plants_shop/screens/info_screen/info_plant.dart';

class TabsItemPlants extends StatelessWidget {
  final String sizePlant;

  const TabsItemPlants({Key key, this.sizePlant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference plants = FirebaseFirestore.instance
        .collection('plants_shop')
        .doc('plants')
        .collection(sizePlant);

    return StreamBuilder(
        stream: plants.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Text("Loading...");
          }
          return GridView(
            padding: EdgeInsets.only(bottom: 15),
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => InfoPlants(
                            name: document.data()['name'],
                            image: document.data()['image'],
                            info: document.data()['info'],
                            size: document.data()['size'],
                            price: document.data()['price'],
                          )));
                },
                child: CardUI(document: document),
              );
            }).toList(),
            scrollDirection: Axis.vertical,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          );
        });
  }
}
