import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food4good_app/app/data/model/product.dart';
import 'package:food4good_app/app/data/repository/products_repository.dart';
import 'package:food4good_app/app/presentation/widgets/Item.dart';
//import 'package:speech_to_text/speech_to_text.dart' as stt;
//import 'package:speech_recognition/speech_recognition.dart';

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
  //List<String>  productList = ['חלב', 'לחם'];
//SpeechRecognition _speechRecognition;
//stt.SpeechToText speech = stt.SpeechToText();
bool _isAvailable = false;
bool _isListening = false;
bool pressed = false;

String resultText = '';
double totalSum = 0.0;

  @override
  void initState() {
    super.initState();
  //  initSpeechRecognizer();
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

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _getCategories(),
              SizedBox(width: 15.0),
              _getDivider(),
              _getProducts(),
              _getChosenItem(),
              SizedBox(height: 10.0),
            //Stack(
            //children: <Widget>[
              _getDivider(),
              Align(
                alignment: Alignment.topRight,
                child: Text('הקניות שלי',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
              ),
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

  _getProducts() {
    return Center(
      child: Container(
        height: 230.0,
        width:1000.0,
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
              setState(() {
                resultText = "speechText";
                pressed = true;
              //  if (_isAvailable && !_isListening)
                //  _speechRecognition
                  //    .listen(locale: "he")
                    //  .then((result) => print('$result'));
             });
            },
          ),
        ),
      ),
    );
  }

_getChosenItem() {
    if(pressed != true)
      return Row(
          children: <Widget> [
            ],
      );
    else
      return Row(
      children: <Widget> [
        SizedBox(width: 5.0),
      Icon(Icons.fastfood),
        SizedBox(width: 15.0),
  Text(resultText,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),),
        SizedBox(width: 30.0),
        ButtonTheme(
          minWidth: 0.0,
          height: 50.0,
          buttonColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          textTheme: ButtonTextTheme.primary,
          child: RaisedButton(
            onPressed: () {
              setState((){
                pressed = false;
             // totalSum += 20;
              });
            },
            child: Text(
              'אישור',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
        ),
  ],

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
              //productList.add(resultText);
              resultText = '';
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
