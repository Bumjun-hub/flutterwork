import 'package:flutter/material.dart';
import 'package:flutter05_instagram/style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
/*
  * 서버(DB)에서 데이터 요청하여 얻어오기
    - get 요청

  * package설치 필요 : http
  * 안드로이드 인터넷사용 권한 설정
  * import 하기
 */
void main() {
  runApp(
      MaterialApp(
          theme: myTheme,
          home: const MyApp()
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // state 변수
  var tab = 0;
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var result = await http.get(Uri.parse('https://jioneproferssor.store/flutter/data/data.json'));
    print(result.body);

    // json을 List로 변환  [{Map},{},{}]
    print(jsonDecode(result.body));

    var feedItems = jsonDecode(result.body);
    print(feedItems[0]['likes']);
    setState(() {
      data = feedItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(
              onPressed: () {
              },
              icon: Icon(Icons.add_box_outlined))
        ],
      ),
      body: [Home(data : data), Text('Shop Page')][tab],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (i) {
            setState(() {
              tab = i;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Shop')
          ]
      ),
    );
  }
}

class Home extends StatelessWidget {
  final List data;
  const Home({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (c, i) {
          return Column(
            children: [
              Image.network(data[i]['image']),
              Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('❤️ 좋아요 ${data[i]['likes']}개'),
                      Text('글쓴이: ${data[i]['user']}'),
                      Text(data[i]['content']),

                    ],
                  )
              ),
            ],
          );
        }
    );
  }
}