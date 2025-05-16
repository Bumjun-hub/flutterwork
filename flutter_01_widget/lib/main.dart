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
  Widget build(BuildContext conetext) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('강남역'),
          backgroundColor: Colors.grey,
          actions: [
            Icon(Icons.search),
            Icon(Icons.menu),
            Icon(Icons.notifications),
          ],
        ),
/*
        body:Column(
          children: [
            Flexible(child: Container(color:Colors.amber), flex:1,),
            Flexible(child: Container(color:Colors.black26), flex: 1,),
            Flexible(child: Container(color:Colors.purpleAccent), flex:1)

          ],
        )

 */
      body: Column(
        children: [
          Container( height: 100, color:Colors.amber),
          Expanded(child:Container(color:Colors.black26))
        ],
      ),
      ),
    );
  }
}
