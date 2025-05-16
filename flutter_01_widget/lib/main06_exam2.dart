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

        body: Container(
          padding: EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 왼쪽 이미지 (비율 5)
              Flexible(
                flex: 6,
                child: Image.asset('assets/images/violet.png', width: double.infinity),
              ),

              SizedBox(width: 15),

              // 오른쪽 텍스트 Column (비율 5)
              Flexible(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 9), // spacing 대신 직접 간격 주기
                    Text(
                      'test1',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 9),
                    Text('test2'),
                    SizedBox(height: 9),
                    Text('test3'),
                    SizedBox(height: 9),
                    Text('test4'),
                  ],
                ),
              ),
            ],
          ),
        ),


      ),
    );
  }
}
