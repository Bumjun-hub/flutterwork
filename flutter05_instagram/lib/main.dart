import 'package:flutter/material.dart';
import 'package:flutter05_instagram/style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';

// 스크롤에 관련된 함수 모음

/*
     Navigator : 화면간의 이동을 관리하는 스택구조의 내비게이션 시스템
     - Navigator.push(context, route) : 새로운 화면을 스택 위에 추가
     - Navigator.pop(context) : 현재 화면을 스택에서 제거하고 이전 화면이 보임
     - Navigator.pushNamed(context, routeName) : 이름으로 등록된 경로로 이동
     - Navigator.pushReplacement(context, route) ; 현재 화면을 새 화면으로 교체
     - Navigator.popUntil(context, predicate) : 특정 조건을 만족할 때까지 뒤로 감

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
  var tab = 0;
  var feedItems = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var result = await http.get(
      Uri.parse('https://jioneproferssor.store/flutter/data/data.json'),
    );
    if (result.statusCode == 200) {
      var result2 = jsonDecode(result.body);
      setState(() {
        feedItems = result2;
      });
    } else {
      throw Exception('get server data 실패');
    }
  }

  @override
  Widget build(BuildContext context) {
    addData(item) {
      setState(() {
        feedItems.add(item);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => upload(), // 또는 원하는 위젯으로 대체
                ),
              );
            },
            icon: Icon(Icons.add_box_outlined),
          ),
        ],
      ),
      body:
          [
            Home(feedItems: feedItems),
            Text('Shop Page'),
          ][tab],
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
            label: 'Shop',
          ),
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key, this.feedItems});

  final feedItems;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // 스크롤바의 위치를 기록해주는 함수
  var scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    // 스크롤 이벤트리스너를 한번 등록
    scroll.addListener(() {
      // print('스크롤의 위치 변함');
      // print(scroll.position.pixels);  // 스크롤이 위에서 부터 얼마나 내려왔는지 높이
      // print(scroll.position.maxScrollExtent);  // 스크롤바를 최대 내릴수 있는 높이
      // print(scroll.position.userScrollDirection);   // 스크롤이 되는 방향
      if (scroll.position.pixels == scroll.position.maxScrollExtent) {
        print('더이상 스크롤될게 없습니다');
      }
    }); // addListener() : 리스너 스크롤될 때 마다 호출
  }

  @override
  Widget build(BuildContext context) {
    if (widget.feedItems.isNotEmpty) {
      return ListView.builder(
        controller: scroll,
        itemCount: 3,
        itemBuilder: (c, i) {
          return Column(
            children: [
              Image.network(widget.feedItems[i]['image']),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('좋아요  ${widget.feedItems[i]['likes']}'),
                    Text('글쓴이  ${widget.feedItems[i]['user']}'),
                    Text('내용  ${widget.feedItems[i]['content']}'),
                  ],
                ),
              ),
            ],
          );
        },
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}
class upload extends StatelessWidget {
  const upload ({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body:Column(
       children: [
         Text('이미지 업로드'),

       ],
     )
   );
  }
}

