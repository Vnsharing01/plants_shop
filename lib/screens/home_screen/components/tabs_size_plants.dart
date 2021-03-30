import 'package:flutter/material.dart';

import 'package:plants_shop/screens/home_screen/components/tabs_items_plants.dart';

/// set Tab zise & content
class TabSizePlants extends StatelessWidget {
  const TabSizePlants({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 5),
            unselectedLabelColor: Colors.green[900],
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green[900],
            ),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.symmetric(vertical: 3),
            tabs: [
              TabsItem(text: "Mini"),
              TabsItem(text: "Medium"),
              TabsItem(text: "Large"),
            ],
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height / 1.2,
          margin: EdgeInsets.only(top: 8),
          child: TabBarView(
            children: [
              TabsItemPlants(sizePlant: 'mini'),
              TabsItemPlants(sizePlant: 'medium'),
              TabsItemPlants(sizePlant: 'large'),
            ],
          ),
        ),
      ),
    );
  }
}

/// customTab
class TabsItem extends StatelessWidget {
  final String text;
  const TabsItem({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.green[900],
            width: 1,
          ),
        ),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
