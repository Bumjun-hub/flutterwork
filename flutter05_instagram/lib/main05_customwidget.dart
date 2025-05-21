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
      body: [BodyCustom(), Text('Shop Page')][tab],
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

class BodyCustom extends StatelessWidget {
  const BodyCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/cat.png', width: 500, height: 320),
            Text('좋아요',style: TextStyle(fontSize: 20,color: Colors.black)),
            Text('글쓴이',style: TextStyle(fontSize: 20,color: Colors.black)),
            Text('글내용',style: TextStyle(fontSize: 20,color: Colors.black)),
          ],
        );
      },
    );
  }
}
