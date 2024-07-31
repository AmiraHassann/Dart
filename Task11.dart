void main() {
  // Create instances of Rectangle and Circle
  Shape rectangle = Rectangle(width: 5, height: 10);
  Shape circle = Circle(radius: 7);

  // Create a list of shapes
  List<Shape> shapes = [rectangle, circle];

  // Calculate and print the area of each shape
  for (var shape in shapes) {
    print('Area of ${shape.runtimeType}: ${shape.calculateArea()}');
  }
}

// Base class
abstract class Shape {
  double calculateArea(); // Abstract method for calculating area
}

// Rectangle class
class Rectangle extends Shape {
  final double width;
  final double height;

  Rectangle({required this.width, required this.height});

  @override
  double calculateArea() {
    return width * height;
  }
}

// Circle class
class Circle extends Shape {
  final double radius;

  Circle({required this.radius});

  @override
  double calculateArea() {
    return 3.14159 * radius * radius; // Using Pi (π) for area calculation
  }
}