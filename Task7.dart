// Remove The Dublicates Numbers

List<int> removeDuplicates(List<int> numbers) {
  return numbers.toSet().toList();
}

void main() {
  List<int> numbers = [1, 2, 2, 3, 4, 4, 5];
  print(removeDuplicates(numbers)); 
}
