import 'dart:io';

//Create abstract classes and define abstract methods that are implemented by subclasses.
// Abstract class
abstract class Shape {
  // Abstract method
  double area();
}

// Encapsulation: Base class with private variables and controlled access
class Rectangle implements Shape {
  double _width;
  double _height;

  Rectangle(this._width, this._height);

  // Getter for width
  double get width => _width;

  // Setter for width
  set width(double value) {
    if (value > 0) _width = value;
  }

  // Getter for height
  double get height => _height;

  // Setter for height
  set height(double value) {
    if (value > 0) _height = value;
  }

  @override
  double area() {
    return _width * _height;
  }
}

// Inheritance: Subclass inheriting from Rectangle
class Square extends Rectangle {
  Square(double side) : super(side, side);

  @override
  double area() {
    return width * width; // Override the area calculation for square
  }
}

// Another Subclass
class Circle implements Shape {
  double _radius;

  Circle(this._radius);

  // Getter for radius
  double get radius => _radius;

  // Setter for radius
  set radius(double value) {
    if (value > 0) _radius = value;
  }

  @override
  double area() {
    return 3.14159 * _radius * _radius;
  }
}

// Polymorphism and Encapsulation Example
void main() {
  print("Enter the shape type (rectangle, square, circle):");
  String shapeType = stdin.readLineSync()!.toLowerCase();

  Shape shape;

  switch (shapeType) {
    case 'rectangle':
      print("Enter width of the rectangle:");
      double width = double.parse(stdin.readLineSync()!);
      print("Enter height of the rectangle:");
      double height = double.parse(stdin.readLineSync()!);
      shape = Rectangle(width, height);
      break;
    case 'square':
      print("Enter side length of the square:");
      double side = double.parse(stdin.readLineSync()!);
      shape = Square(side);
      break;
    case 'circle':
      print("Enter radius of the circle:");
      double radius = double.parse(stdin.readLineSync()!);
      shape = Circle(radius);
      break;
    default:
      print("Unknown shape type.");
      return;
  }

  print("The area of the $shapeType is: ${shape.area().toStringAsFixed(2)}");
}
