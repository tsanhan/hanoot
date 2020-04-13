import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  static const String SCREEN_NAME = 'MainScreen';

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  double textSize;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.grey[100],
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 15.0),
            _getDivider(),
            _getProducts(),
            _getDivider(),
            _getShoppingList(),
            _getPressToOrder(),
          ],
        ),
      ),
    );

  }

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




  _getShoppingList() {
  return Expanded(
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
}
