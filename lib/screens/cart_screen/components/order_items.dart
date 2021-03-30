import 'package:flutter/material.dart';
import 'package:plants_shop/components/text_amount_and_price.dart';

class OrderItems extends StatelessWidget {
  const OrderItems({
    Key key,
    this.name,
    this.image,
    this.price,
    this.amount,
  }) : super(key: key);

  final String name, image, price;
  final int amount;

  @override
  Widget build(BuildContext context) {
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
                image,
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
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextAmountAndPrice(
                      text: "Số lượng: ",
                      textInfo: "$amount",
                    ),
                    TextAmountAndPrice(
                      text: "Giá: ",
                      textInfo: price,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
