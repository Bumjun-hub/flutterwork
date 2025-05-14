// static : 호출시 반드시 클래스명.변수명(함수명) 호출.
//          객체명.변수명으로 호출 안됨
void main() {
  Employee hong = Employee('길동');

  hong.name = '바꿈';
  hong.printNameBuilding();

  Employee.building = '한국빌딩';
  hong.printNameBuilding();
  Employee.printBuilding();
}

class Employee {
  static String? building;
  String name;

  Employee(this.name);

  static printBuilding() {
    print('$building 건물에서 수업중 입니다');
  }

  printNameBuilding() {
    print('이름은 $name입니다. $building 건물에서 수업중 입니다');
  }

}