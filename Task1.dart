// Print The Even Numbers

void printEvenNumbers() {
  for (int i = 1; i <= 100; i++) {
    if (i % 2 == 0) {
      print(i);
    }
  }
}

// Print The Sum Of Even Numbers

void printsumEvenNumbers() {
  int sum = 0;
  for (int i = 1; i <= 100; i++) {
    if (i % 2 == 0) {
      sum += i;
    }
  }
  print("Result is :$sum");
}
void main() {
  printsumEvenNumbers();
  printEvenNumbers();
}
