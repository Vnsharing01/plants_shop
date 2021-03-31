import 'package:flutter/material.dart';
import 'package:plants_shop/screens/home_screen/pages/favourite_page.dart';
import 'package:plants_shop/screens/home_screen/pages/home_page.dart';
import 'package:plants_shop/screens/home_screen/pages/order_page.dart';
import 'package:plants_shop/screens/order_screen/order_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final _pageOptions = [
    HomePage(),
    FavouritePage(),
    OrderPage(),
  ];

  final _appBarOptions = [
    "Home",
    "Favourite",
    "Order",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFCC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "${_appBarOptions[_selectedIndex]}",
          style: TextStyle(
            fontSize: 20,
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return OrderScreen();
                }));
              },
              child: CircleAvatar(
                backgroundColor: Colors.green[700],
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: false,
      body: SingleChildScrollView(
        child: _pageOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFFFFCC),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: 'favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: 'cart',
          ),
        ],
        selectedItemColor: Colors.deepOrange,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
