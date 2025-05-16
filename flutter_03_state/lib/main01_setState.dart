import 'package:flutter/material.dart';

/*
   * state(변수)
   : 일반 변수와 다른점은 변경이 되면 재렌더링을 해줌
   > state 변수를 사용하려면 StatefulWidget 안에서 사용
 */

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var num = 1;
  var name = ['홍길동','더조은','빛나리'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Text(num.toString()),
            onPressed: (){
          print('지역변수 num = $num');
          setState(() {
            num++;
          });


        }),
        appBar: AppBar(title: Text("주소록", style: TextStyle(fontSize: 20),),
          backgroundColor: Color(0xFFf3edf7),
          leading: Icon(Icons.list),
          actions: [
            Icon(Icons.search),
            Icon(Icons.share)
          ],
        ),

        /*
        body: ListView(
          children: [
            ListTile(
              leading: Image.asset('assets/user1.png'),
              title: Text('홍길동'),
            ),
            ListTile(
              leading: Image.asset('assets/user2.png'),
              title: Text('이한빛'),
            )
          ],
        )
        */
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
                leading: Image.asset('assets/images/human.png'),
                title: Text(name[index]),


            );
          },
          itemCount: 3,
        ),
        bottomNavigationBar: ProductItem(),
      ),
    );
  }
}

class ProductItem extends StatelessWidget{
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context){

    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.phone),
          Icon(Icons.article_outlined),
          Icon(Icons.contacts)

        ],
      ),

    );
  }
}


