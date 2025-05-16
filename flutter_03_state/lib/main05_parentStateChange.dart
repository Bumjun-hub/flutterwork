import 'package:flutter/material.dart';

/*
    * 부모의 state를 자식이 변경하기
    1. 부모에서 수정 함수 만들기
    2. 자식은 state에 보내기

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
  var num = 5;
  var name = ['홍길동', '더조은', '빛나리'];
  var like = [0, 0, 0];

  // 수정함수에 쓰일 total 변수
  var total = 3;

  // 1. 수정함수 만들기
  addFriend(){
    setState(() {
      total++;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('dialog'),
        onPressed: () {
          showDialog(
            context: context /* 부모에 대한 정보 */,
            builder: (context) {
              return CustomDialog(friendState : addFriend);
            },
          );
        },
      ),
      appBar: AppBar(
        title: Text(total.toString()),
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

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, this.friendState});
  final friendState;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 500,
        height: 300,
        child: Column(

          children: [
            TextField(),
            // 3. 사용하기
            TextButton(onPressed: () {friendState(); Navigator.pop(context);}, child: Text('완료')),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('취소'),
            ), // Navigator.pop(context) 현재페이지 삭제(나가기)
          ],
        ),
      ),
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
