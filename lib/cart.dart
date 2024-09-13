import 'package:flutter/material.dart';
import 'package:diabets/homepage.dart';

class Cart extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  const Cart({super.key, required this.cartItems});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedItemColor: Colors.orange,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
      endDrawer: Drawer(),
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_basket, color: Colors.black),
            Text(" Cart", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ],
        ),
        elevation: 0.0,
        backgroundColor: Colors.grey[200],
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(widget.cartItems[index]["image"]),
            title: Text(widget.cartItems[index]["title"]),
            subtitle: Text(widget.cartItems[index]["price"]),
          );
        },
      ),
    );
  }
}
