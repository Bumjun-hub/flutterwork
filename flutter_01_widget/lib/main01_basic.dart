import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode는 제거
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black, // 어두운 배경
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('제목')), // 글씨 색은 위에서 설정됨
        body: Center(
          child: Text(
            '본문내용',
            style: TextStyle(color: Colors.white),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey[900],
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              '하단바',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
