import 'package:flutter/material.dart';
import 'package:plants_shop/screens/cart_screen/components/order_items.dart';

class CartScreen extends StatelessWidget {
  final String name, image, price;
  final int amount;

  const CartScreen({
    Key key,
    this.name,
    this.image,
    this.price,
    this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFCC),
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: OrderItems(
                name: name,
                image: image,
                amount: amount,
                price: price,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
        iconSize: 36,
        icon: Icon(Icons.arrow_back_outlined),
        color: Colors.green[900],
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(
        "Order",
        style: TextStyle(
          fontSize: 20,
          color: Colors.green[900],
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }
}
