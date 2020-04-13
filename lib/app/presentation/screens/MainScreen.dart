import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import '../../data/model/product.dart';
import '../../data/repository/products_repository.dart';


class MainScreen extends StatefulWidget {
  static const String SCREEN_NAME = 'MainScreen';

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  double textSize;
  var _products = <Product>[]; // yakir

  var productsRepository = ProductsRepositoryImpl();

  List<Product> chosenProduct = new List();
  Product _chosenProduct;


  @override
  void initState() {
    super.initState();
    _init();
  }


  Future<void> _init() async {
    var result = await productsRepository.fetchProductByCategoryId(0);
    setState(() {
      _products.clear();
      _products.addAll(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    _chosenProduct = new Product(name: "חלב", price: 5, units: 1); //temp, for testing
    chosenProduct.add(_chosenProduct); //temp , for testing
    _chosenProduct = new Product(name: "חזה עוף", price: 20, units: 3); //temp, for testing
    chosenProduct.add(_chosenProduct); //temp , for testing
    _chosenProduct = new Product(name: "לחם אחיד פרוס", price: 15, units: 1); //temp, for testing
    chosenProduct.add(_chosenProduct); //temp , for testing

    return SafeArea(
      child: Scaffold(
//      appBar: AppBar(
//        title: Text(''),
//        backgroundColor: Colors.grey[100],
//      ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _getCategories(),
              SizedBox(width: 15.0),
              _getDivider(),
              _getProducts(),
              SizedBox(height: 10.0),
            //Stack(
            //children: <Widget>[
              _getShoppingList(),
              SizedBox(height: 10.0),
              _getPressToOrder(),
          //    ],
        //  ),
            ],
           ),
        ),
      ),
    );
  }
//
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Scaffold(
////      appBar: AppBar(
////        title: Text(''),
////        backgroundColor: Colors.grey[100],
////      ),
//        body: Container(
//          padding: const EdgeInsets.all(8.0),
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              _getCategories(),
//              SizedBox(width: 15.0),
//              _getDivider(),
//              _getProducts(),
//              _getDivider(),
//              _getShoppingList(),
//              _getPressToOrder(),
//            ],
//          ),
//        ),
//      ),
//    );
//  }


  _getProducts() {
    return Center(
      child: Container(
        height: 250.0,
        width: 1000.0,
        child: Ink(
          decoration: ShapeDecoration(
            color: Colors.blue,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: Icon(Icons.mic),
            color: Colors.white,

            iconSize: 140,
            onPressed: () {
              print("You Pressed the icon!");
            },
          ),
        ),
      ),
    );
  }





  _getCategories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        ButtonTheme(
          minWidth: 0.0,
          height: 50.0,
          buttonColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          textTheme: ButtonTextTheme.primary,
          child: RaisedButton(
            onPressed: () async {
              var result = await productsRepository.fetchProductByCategoryId(2);
              setState(() {
                _products.clear();
                _products.addAll(result);
              });
            },
            child: Text(
              'ה-חנות!',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }


  _getShoppingList() {
  return Expanded(
    child: Container(
        child: ListTile(
          //leading: ,
      title: Text(chosenProduct[0].name + "     "  + chosenProduct[0].price.toString() + ' ש"ח'
      ),
        ),
        padding: EdgeInsets.all(6.0),
        decoration: BoxDecoration(color: Colors.white,
            border: Border.all(width: 20.0, color: Colors.blue),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.grey,
                offset: Offset(3.0, 3.0)),
            ]
        )
    ),
  );
  }

  _getPressToOrder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        ButtonTheme(
          minWidth: 150.0,
          height: 50.0,
          buttonColor: Colors.grey[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          textTheme: ButtonTextTheme.primary,
          child: RaisedButton(
            onPressed: () {
              ;
            },
            child: Text(
              'הזמן',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  _getDivider() {
    return Divider(
      height: 10.0,
      indent: 5.0,
      thickness: 0.5,
      color: Colors.black,
    );
  }

  void _addToCart(Product selectedProduct) {
    setState(() {
      //_cart.add(selectedProduct);
    });
  }

// items

}
