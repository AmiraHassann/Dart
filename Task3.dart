// Calculate The Average Number

double calculateAverage(List<int> numbers) {
  int sum = 0;
  for (int number in numbers) {
    sum += number;
  }
  return sum / numbers.length;
}

void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  print(calculateAverage(numbers)); 
}
