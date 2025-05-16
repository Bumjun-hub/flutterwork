import 'package:flutter/material.dart';
/*
    * 박스의 margin, padding, 정렬위젯(Align())
 */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('예제'), backgroundColor: Color(0xFFf3edf7)),
        body: Container(
            width: 100, height: 100, color: Colors.redAccent, margin:EdgeInsets.all(30),
            padding: EdgeInsets.all(20),
            child: Text("본문내용")),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.shopping_cart),
                Icon(Icons.shopping_bag),
                Icon(Icons.account_circle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
