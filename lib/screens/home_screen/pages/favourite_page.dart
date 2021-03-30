import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plants_shop/screens/home_screen/components/card_ui.dart';
import 'package:plants_shop/screens/info_screen/info_plant.dart';

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference plants = FirebaseFirestore.instance
        .collection('plants_shop')
        .doc('user')
        .collection('farvote');

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.05,
            child: StreamBuilder(
                stream: plants.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("Loading...");
                  }
                  return GridView(
                    padding: EdgeInsets.only(bottom: 15),
                    children:
                        snapshot.data.docs.map((DocumentSnapshot document) {
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
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
