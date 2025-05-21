import 'package:flutter/material.dart';
import 'package:flutter05_instagram/style.dart';

/*
    * 탭 만들기
    순서
    1. state 에 tab의 현재 상태 저장
    2. state에 따라 tab이 어떻게 보일지 작성
    3. 유저가 쉽게 state 조작할 수 있는 조작기능

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
      body: [Text('Home Page'), Text('Shop Page')][tab],
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
