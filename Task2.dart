// Print The Primer Number

bool isPrime(int num) {
  if (num <= 1) return false;
  for (int i = 2; i <= num ~/ 2; i++) {
    if (num % i == 0) return false;
  }
  return true;
}

void main() {
  print("Primer Numbers are :");
  for (int i = 1; i <= 100; i++) {
    if (isPrime(i)) {
      print(i);
    }
  }
}


