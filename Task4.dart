// Find The Largest Number

int findLargest(List<int> numbers) {
  int largest = numbers[0];
  for (int number in numbers) {
    if (number > largest) {
      largest = number;
    }
  }
  return largest;
}

// Find The Smallest Number

int findSmallest(List<int> numbers) {
  int smallest = numbers[0] ;
  for (var number in numbers) {
    if (number < smallest) {
      smallest = number ;
    }
  }
  return smallest;
}
void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  print(findLargest(numbers)); 
  print(findSmallest(numbers));
}
