import 'package:diabets/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Ecommerce());
}

class Ecommerce extends StatefulWidget {
  const Ecommerce({super.key});

  @override
  State<Ecommerce> createState() => _EcommerceState();
}

class _EcommerceState extends State<Ecommerce> {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(
      ),
    );
  }
}
