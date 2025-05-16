
import 'package:flutter/material.dart';

/*
    * dialog 창 만들기

    - 매개변수로 context를 받아 사용하는 위젯들
    showDialog()
    Navigator()
    Theme.of()
    Scaffold.of()
 */

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var num = 1;
  var name = ['홍길동', '더조은', '빛나리'];
  var like = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('dialog'),
        onPressed: () {
          showDialog(
            context: context /* 부모에 대한 정보 */,
            builder: (context) {
              return Dialog(
                child: Container(
                  width: 500,
                  height: 300,
                  child: Column(
                    children: [
                      TextField(),
                      TextButton(onPressed: () {}, child: Text('완료')),
                      TextButton(onPressed: () {Navigator.pop(context);}, child: Text('취소')) // Navigator.pop(context) 현재페이지 삭제(나가기)
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      appBar: AppBar(
        title: Text("주소록", style: TextStyle(fontSize: 20)),
        backgroundColor: Color(0xFFf3edf7),
        leading: Icon(Icons.list),
        actions: [Icon(Icons.search), Icon(Icons.share)],
      ),
      // body: Dialog(child: Text('dialog 창')),/*
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(
              like[index].toString(),
              style: TextStyle(fontSize: 18),
            ),
            title: Text(name[index]),
            trailing: IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () {
                setState(() {
                  like[index]++;
                });
              },
            ),
          );
        },
        itemCount: 3,
      ),

      bottomNavigationBar: ProductItem(),
    );
  }
}


class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.phone),
          Icon(Icons.article_outlined),
          Icon(Icons.contacts),
        ],
      ),
    );
  }
}
