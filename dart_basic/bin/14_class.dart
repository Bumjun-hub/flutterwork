/*
    class : java와 같음. 모든 클래스의 부모는 Object

 */


void main() {
  Idol blackpink = Idol();
  print(blackpink.name);
  blackpink.sayHello();
  blackpink.introduce();
  print(blackpink.memberCount());


}

class Idol{
  String name = '블랙핑크';
  List<String> members = ['리사','로제','제니','지수'];

  sayHello(){
    print('안녕하세요 블랙핑크입니다');
  }

  introduce(){
    print('저희 멤버는 제니, 지수, 로제, 리사 입니다');
  }
 int memberCount(){
    return members.length;
 }
}