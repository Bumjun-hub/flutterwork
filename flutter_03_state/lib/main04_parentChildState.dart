import 'package:flutter/material.dart';

/*
자식이 부모이 변수의 값을 사용하려면
1. 부모가 자식에게 보내기
2. 자식은 등록
3. 자식이 사용

 */

void main() {
  runApp(MaterialApp(home: MyApp()));
}a

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var num = 5;
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
              return CustomDialog(num: num);
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

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, this.num});
  final num;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 500,
        height: 300,
        child: Column(
          children: [
            TextField(),
            TextButton(onPressed: () {}, child: Text(num.toString())),
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
