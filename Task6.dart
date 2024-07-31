// Reverse String

String reverseString(String input) {
  return input.split('').reversed.join('');
}

void main() {
  print(reverseString("My name is amira"));
}
