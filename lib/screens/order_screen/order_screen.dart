import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plants_shop/components/text_amount_and_price.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference order = FirebaseFirestore.instance
        .collection('plants_shop')
        .doc('user')
        .collection('orders');
    return Scaffold(
      backgroundColor: Color(0xFFFFFFCC),
      appBar: AppBar(
        title: Text(
          'Order',
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        child: StreamBuilder(
            stream: order.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Text("Loading...");
              }
              return ListView(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  return Card(
                    child: Container(
                      width: double.infinity,
                      height: 120,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            padding: EdgeInsets.all(5),
                            child: Image.network(
                              document.data()['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    document.data()['name'],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  TextAmountAndPrice(
                                    text: "Số lượng: ",
                                    textInfo:
                                        document.data()['amount'].toString(),
                                  ),
                                  TextAmountAndPrice(
                                    text: "Giá: ",
                                    textInfo: document.data()['price'],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            }),
      ),
    );
  }
}
