import 'package:flutter/material.dart';

/// thông tin cây cảnh
class TextInfoPlants extends StatelessWidget {
  const TextInfoPlants({
    Key key,
    this.name,
    this.info,
    this.size,
  }) : super(key: key);

  final String name, info, size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
      child: Column(
        children: [
          // Tên cây
          Text(
            name,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 8),
          // kích cỡ cây
          Text(
            "Size : $size",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          // thông tin cây
          Text(
            "thông tin : \n $info",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
