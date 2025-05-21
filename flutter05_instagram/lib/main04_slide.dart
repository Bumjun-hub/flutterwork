import 'package:flutter/material.dart';
import 'package:flutter05_instagram/style.dart';

/*
    * 슬라이드
      PageView() 사용

 */

void main() {
  runApp(MaterialApp(theme: myTheme, home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 1;

  @override
  Widget build(BuildContext context) {
    var textColor = TextStyle(fontSize: 20, color: Colors.blueGrey);
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border),
            iconSize: 30,
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.send), iconSize: 30),
        ],
      ),
      body: PageView(
        children: [
          Center(child: Text('Home Page')),
          Center(child: Text('Shop Page')),
          Center(child: Text('Profile Page')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (i) {
          setState(() {
            tab = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Shopping',
          ),
        ],
      ),
    );
  }
}
