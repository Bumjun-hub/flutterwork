/*
    named parameter : 이름이 있는 파라미터, 순서가 필요없음

 */
void main() {
  addNumbers(y: 10, x: 5, z: 20);
  addNumbers2(x: 10, y: 40);
  addNumbers2(x: 10, y: 40, z: 20);
  print(addNumbers3(y: 10, x: 5));
  print(addNumbers6(10, y:20));
}

addNumbers({required int x, required int y, required int z}) {
  int sum = x + y + z;
  print('x = $x');
  print('y = $y');
  print('z = $z');
  print('sum = $sum');
}

addNumbers2({required int x, required int y, int z = 50}) {
  int sum = x + y + z;
  print('x = $x');
  print('y = $y');
  print('z = $z');
  print('sum = $sum');
}

// return이 있는 함수
int addNumbers3({required int x, required int y, int z = 50}) {
  int sum = x + y + z;
  print('x = $x');
  print('y = $y');
  print('z = $z');
  return sum;
}

int addNumbers5(int x, {required int y, int z = 50}) {
  int sum = x + y + z;
  return sum;
}

// addNumbers5를 화살표 함수로
int addNumbers6(int x, {required int y, int z=50}) => x+y+z;
