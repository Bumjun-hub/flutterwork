void main(){

}

class Idol{
  String name;
  List<String> members;

  Idol(this.name, this.members);

  Idol.fromList(List values)
  : this.members= values[0],
    this.name = values[1];


}