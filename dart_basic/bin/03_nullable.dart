/*
  - Null safety 타입 : 2.12 버전부터 도입
  - null 값에 대한 안정성을 보장하기 위한 모든 변수는 nullable과 none-nullable로 구분

  1. Nullable Type : null을 허용하는 타입
     변수 뒤에 ?를 붙여 활용
  2. none-nullable Type : null을 허용하지 않음
     아무것도 붙이지 않는다
 */

void main() {
  String name = 'hong';
  // name = null; 오류 null 허용하지 않음
  print(name);

  String? name2 = 'gil';
  name2 = null;
  print(name2);

  String? name3;
  print(name3);

  // 모든 자료형에 ?를 넣을 수 있다

  int? num = 2;
  num = null;
  print(num);

  // ! : nullable type으로 선언을 했을 때 변수 뒤에 !를 붙여 null인 경우 오류를 발생!
  //     변수명에 !를 붙이면, Non-nullable의 타입

  String? name4 = 'dong';

  print(name4!);

  name4 = null;
  print(name4);
  print(name4!); // 오류 TypeError

  int? num1;
  int num2 = 3;

  // print(num1 + num2); // 오류 null값 허용 타입과 허용하지 않는 타입
  // print(num1! = num2); // build 에서는 오류가 안뜨지만 실행시 오류

  // ?? : null일 때 대체값을 넣어 줄 수 있음
   print((num1 ??5 ) + num2);
}
