import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

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
    );
  }

  _getProducts() {
    return Expanded(
      child: Column(
          children: <Widget>[
            Text('כאן יופיעו המוצרים')
            ],
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
              onPressed: () {
                ;
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
              onPressed: () {
                ;
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
              onPressed: () {
                ;
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
