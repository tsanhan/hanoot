import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("פשוט_לקנות");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: (){
              setState(() {

              });
            },
            icon: cusIcon,
          ),
        ],
        centerTitle: true,
        title: cusSearchBar,
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
          selectedFontSize: 30,
          unselectedFontSize: 25,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sort),
              title: Text('sort'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('list of suppliers'),
            ),
          ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

