import 'package:flutter/material.dart';
import 'package:plants_shop/screens/home_screen/components/home_banner.dart';
import 'package:plants_shop/screens/home_screen/components/tabs_size_plants.dart';

/// màn hình Home
class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HomeBanner(),
          Container(
            height: MediaQuery.of(context).size.height / 1.05,
            child: TabSizePlants(),
          ),
        ],
      ),
    );
  }
}
