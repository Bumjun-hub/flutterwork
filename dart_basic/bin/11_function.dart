/*
    parameter (argment) : 순서와 개수가 동일.
    optional parameter : 파라미터의 개수가 미지수일 때
 */

void main() {
  function1();
  addNumbers(10, 23, 38); // parameter ( argment )
  addNumbers2(1);
}

function1() {
  print('fucntion1 실행');
}

addNumbers(int x, int y, int z) {
  int sum = x + y + z;

  if (sum % 2 == 0) {
    print(' 합계 : ${sum} / 짝수입니다');
  } else {
    print(' 합계 : ${sum} / 홀수입니다');
  }
}

// 파라미터가 미지수일 때 대괄호로 묶어준다
// 기본값을 넣어주면 값이 있으면 원래 값으로,  값이 없으면 기본값으로 넣어줌
addNumbers2(int x, [int y = 23, int z = 30]) {
  int sum = x + y + z;
  if (sum % 2 == 0) {
    print(' 합계 : ${sum} / 짝수입니다');
  } else {
    print(' 합계 : ${sum} / 홀수입니다');
  }
}

/*
addNumbers3(int x, [int? y, int? z]) {
  int sum = x + y + z; // 오류 숫자 +null이기 때문
}
 */

/*
addNumbers3(int x, [int y, int z]){ // 파라미터가 안들어울 경우 null이 되므로 오류
  int sum = x+y+z;
}

 */
