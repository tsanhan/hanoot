import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food4good_app/app/data/model/product.dart';
import 'package:food4good_app/app/data/repository/products_repository.dart';
import 'package:food4good_app/app/presentation/widgets/Item.dart';

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
  var _cart = <Product>[]; // yasmin

  //
  var productsRepository = ProductsRepositoryImpl();

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
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
              _getDivider(),
              _getShoppingList(),
              _getPressToOrder(),
            ],
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
          buttonColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          textTheme: ButtonTextTheme.primary,
          child: RaisedButton(
            onPressed: () async {
              var result = await productsRepository.fetchProductByCategoryId(0);
              setState(() {
                _products.clear();
                _products.addAll(result);
              });
            },
            child: Text(
              'ירקות',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
        ),
        SizedBox(width: (5.0)),
        ButtonTheme(
          minWidth: 0.0,
          height: 50.0,
          buttonColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          textTheme: ButtonTextTheme.primary,
          child: RaisedButton(
            onPressed: () async {
              var result = await productsRepository.fetchProductByCategoryId(1);
              setState(() {
                _products.clear();
                _products.addAll(result);
              });
            },
            child: Text(
              'חלב',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
        ),
        SizedBox(width: (5.0)),
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
              'בשר',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  _getProducts() {
    return Expanded(
      flex: 3,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: _products
                .map((product) => Item(
                      product: product,
                      onPressed: () {
                        _addToCart(product);
                      },
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  _getShoppingList() {
    return Expanded(
      flex: 2,
      child: Container(
        child: Text('זוהי רשימת הקניות'),
      ),
    );
  }

  _getPressToOrder() {
    return Column(
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
      _cart.add(selectedProduct);
    });
  }

// items

}