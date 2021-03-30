import 'package:flutter/material.dart';

/// btn số lượng cây tăng giảm
class BtnAmount extends StatelessWidget {
  const BtnAmount({
    Key key,
    this.press,
    this.icon,
  }) : super(key: key);

  final Function press;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 30,
        height: 30,
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: press,
          icon: icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
