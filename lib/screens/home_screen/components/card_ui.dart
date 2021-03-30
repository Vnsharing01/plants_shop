import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CardUI extends StatelessWidget {
  const CardUI({
    Key key,
    this.document,
  }) : super(key: key);
  final DocumentSnapshot document;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Image.network(
              document.data()['image'],
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
