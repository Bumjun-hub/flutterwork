void main() {
  List<String> blackPink = ['로제','지수','리사','제니'];
  print(blackPink.runtimeType);
  print(blackPink.asMap());  // List -> Map변경
  print(blackPink.toSet());  // List -> Set변경

  Map blackPinkMap = blackPink.asMap();
  print(blackPinkMap.keys);

  // Map -> List
  print(blackPinkMap.keys.toList());  // 키만 리스트로
  print(blackPinkMap.values.toList());  // 값만 리스트로

  // List -> set. 2가지 방법
  Set blackPinkSet = blackPink.toSet();
  Set blackPinkSet2 = Set.from(blackPink);

  // set -> List
  print(blackPinkSet2.toList());
}