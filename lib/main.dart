import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const Diabets());
}

class Diabets extends StatefulWidget {
  const Diabets({super.key});

  @override
  State<Diabets> createState() => _DiabetsState();
}

class _DiabetsState extends State<Diabets> {
 
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(
      ),
    );
  }
}
