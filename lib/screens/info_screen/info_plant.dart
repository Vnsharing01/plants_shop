import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plants_shop/model/amount.dart';
import 'package:plants_shop/model/favourite.dart';
import 'package:plants_shop/screens/cart_screen/cart_screen.dart';
import 'package:plants_shop/screens/info_screen/components/button_amount.dart';
import 'package:plants_shop/screens/info_screen/components/text_info_plants.dart';

/// provider số lượng cây
final amountPlantProvider =
    StateNotifierProvider((ref) => AmountStateNotifier());

/// provider yêu thích
final favouriteProvider =
    StateNotifierProvider((ref) => FavouriteStateNotifier());

class InfoPlants extends ConsumerWidget {
  const InfoPlants({
    Key key,
    this.name,
    this.size,
    this.image,
    this.info,
    this.price,
  }) : super(key: key);
  final String name, size, image, info, price;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final amountModel = watch(amountPlantProvider.state);
    var favourtieModel = watch(favouriteProvider.state);

    CollectionReference likePlants = FirebaseFirestore.instance
        .collection('plants_shop')
        .doc('user')
        .collection('farvote');

    CollectionReference order = FirebaseFirestore.instance
        .collection('plants_shop')
        .doc('user')
        .collection('orders');

    return Scaffold(
      backgroundColor: Color(0xFFFFFFCC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          iconSize: 36,
          icon: Icon(Icons.arrow_back_outlined),
          color: Colors.green[900],
          onPressed: () {
            context.refresh(amountPlantProvider);
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Details",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: GestureDetector(
                onTap: () {
                  context.read(favouriteProvider).liked();
                  if (favourtieModel == false) {
                    favourtieModel = true;

                    /// thêm 1 bản ghi yêu thích vào firebase
                    likePlants.doc(name).set({
                      "name": name,
                      "image": image,
                      "info": info,
                      "size": size,
                      "price": price,
                      "like": favourtieModel,
                    });
                  } else {
                    favourtieModel = false;
                    likePlants.doc(name).delete();
                  }
                },
                child: Icon(
                  favourtieModel != true
                      ? Icons.favorite_outline
                      : Icons.favorite_rounded,
                  color: favourtieModel != true
                      ? Colors.green[900]
                      : Colors.deepOrange,
                  size: 40,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              margin: EdgeInsets.only(top: 16),
              child: Image.network(
                image,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            TextInfoPlants(
              name: name,
              info: info,
              size: size,
            ),
            Container(
              child: Column(
                children: [
                  AmountAndPrice(amountModel: amountModel, price: price),
                  // btn đặt hàng
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextButton(
                      child: Text(
                        "Đặt hàng",
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.green[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CartScreen(
                              name: name,
                              image: image,
                              amount: amountModel.count,
                              price: price,
                            ),
                          ),
                        );

                        /// thêm bản ghi đặt hàng lên firebase
                        order.doc(name).set({
                          "name": name,
                          "image": image,
                          "price": price,
                          "amount": amountModel.count,
                        }).then((_) => print('đã đặt hàng'));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// số lượng cây và giá cây
class AmountAndPrice extends StatelessWidget {
  const AmountAndPrice({
    Key key,
    @required this.amountModel,
    @required this.price,
  }) : super(key: key);

  final Amount amountModel;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              BtnAmount(
                icon: Icon(Icons.add),
                press: () {
                  context.read(amountPlantProvider).addPlants();
                },
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "${amountModel.count}",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              BtnAmount(
                icon: Icon(Icons.remove),
                press: () {
                  context.read(amountPlantProvider).removePlants();
                },
              ),
            ],
          ),
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            price,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
