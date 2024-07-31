// Find Prime Numbers In Range between two numbers

void main() {
  int start = 20 ;
  int end = 70 ;

  List<int> primes = findPrimesInRange(start,end) ;
  print("Prime Numbers between $start and $end : $primes") ;
}

List<int> findPrimesInRange(int start , int end) {
  List<int> primes = [] ;
  for(int i = start ; i <= end ; i++) {
    if (isPrime(i)) {
      primes.add(i) ;
    }
  }
  return primes ;
}

bool isPrime(int number) {
  if (number <= 1) {
    return false ;
  }
  for (int i = 2; i <= number ~/ 2; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}