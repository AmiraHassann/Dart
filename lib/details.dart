import 'package:diabets/cart.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  final Map<String, dynamic> data;
  final Function(Map<String, dynamic>) addToCart;

  const ItemDetails({super.key, required this.data, required this.addToCart});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Cart(cartItems: [],)),
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
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined) , label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart) , label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.person) , label: ""),
      ],),
      endDrawer: Drawer(),
      appBar: AppBar(
        title:const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shop_outlined , color: Colors.black),
            Text(" Item" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold)),
            Text("Details" , style: TextStyle(color: Colors.orange)),
          ],
        ),
        elevation: 0.0,
        backgroundColor: Colors.grey[200],
      ),
      body: ListView(children: [
        Image.asset(widget.data["image"]),
        Container(
          child: Text(widget.data["title"] , textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20))),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(widget.data["subtitle"] , textAlign: TextAlign.center ,
          style: TextStyle(color: Colors.grey[800]))),
          Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(widget.data["details"] , textAlign: TextAlign.center ,
          style: TextStyle(color: Colors.grey[800]),)),
          Container(
          margin: EdgeInsets.only(top: 10 , bottom: 25),
          child: Text(widget.data["price"] , textAlign: TextAlign.center ,
          style: TextStyle(color: Colors.orange , fontWeight: FontWeight.bold , fontSize: 17))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Color : " , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.w500)),
              SizedBox(width: 10),
              Container(
                height: 20, width: 20, decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.orange),
                ),
              ),
              Text("  Grey"),
              SizedBox(width: 25),
              Container(
                height: 20, width: 20, decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Text("  Black"),
            ]),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text("Size :    34    36    38    40" , 
              style: TextStyle(color: Colors.grey , fontWeight: FontWeight.w500),
              textAlign: TextAlign.center)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 82 , vertical: 25),
                child: MaterialButton(
                padding: EdgeInsets.symmetric(vertical: 12),
                color: Colors.black,
                textColor: Colors.white,
                onPressed: () {
                  widget.addToCart(widget.data); // إضافة العنصر للعربة
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cart(cartItems: [widget.data]),
                    ),
                  );
                },
                child: Text(
                  "Add To Cart",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              )
      ]),
    );
  }
}
