import 'package:diabets/cart.dart';
import 'package:diabets/details.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List<Map<String, dynamic>> cartItems = [];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });

  if (index == 1) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Cart(cartItems: cartItems)),
    );
  }
}


  void addToCart(Map<String, dynamic> item) {
    setState(() {
      cartItems.add(item);
    }); 
    }

  List categories = [
    {
      "iconname" :Icons.laptop ,
      "title" : "Laptop"
    } ,
    {
      "iconname" :Icons.camera_alt_rounded ,
      "title" : "Camera"
    } ,
    {
      "iconname" :Icons.tv_rounded ,
      "title" : "TV"
    } ,
    {
      "iconname" :Icons.phone_android_rounded ,
      "title" : "Mobile"
    } ,
    {
      "iconname" :Icons.watch_rounded ,
      "title" : "Watch"
    } ,
  ];

  List items = [
    {
      "image": "images/lap1.png",
      "title": "Laptop",
      "subtitle":"Description:",
      "details":"Laptop Dell 5570",
      "price":"650\$"
    },
    {
      "image": "images/tv1.png",
      "title": "TV",
      "subtitle":"Description:",
      "details":"Tv LG",
      "price":"550\$"
    },
    {
      "image": "images/iphone1.png",
      "title": "Iphone",
      "subtitle":"Description:",
      "details":"iphone 15 pro max",
      "price":"600\$"
    },
    {
      "image": "images/smart1.png",
      "title": "Smart Watch",
      "subtitle":"Description:",
      "details":"sale 20%",
      "price":"240\$"
    },
    {
      "image": "images/camera.png",
      "title": "Camera",
      "subtitle":"Description:",
      "details":"get 30 card",
      "price":"399\$"
    },
    {
      "image": "images/iphone2.png",
      "title": "Iphone",
      "subtitle":"Description:",
      "details":"iphone 15",
      "price":"490\$"
    },
    {
      "image": "images/lap2.png",
      "title": "Laptop",
      "subtitle":"Description:",
      "details":"Laptop HP 5570",
      "price":"720\$"
    },
    {
      "image": "images/tv2.png",
      "title": "TV",
      "subtitle":"Description:",
      "details":"Smart lg tv ",
      "price":"590\$"
    },
    {
      "image": "images/smart2.png",
      "title": "Smart Watch",
      "subtitle":"Description:",
      "details":"watch casio IP68",
      "price":"320\$"
    },
  ];

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
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(border: InputBorder.none ,
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search" ,
                  fillColor: Colors.grey[200] ,
                  filled: true
                  ),
                )),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(Icons.menu , size: 40,),
                )
            ],
          ),
          Container(height: 30) ,
          Text("Categories" , 
          style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),
          ),
          Container(height: 20),
          Container(
            height: 100,
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,i) {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(100)),
                        child: Icon(categories[i]["iconname"],size: 40), 
                        padding: EdgeInsets.all(15),
                        ),
                        Text(categories[i]["title"], 
                        style: TextStyle(fontWeight: FontWeight.bold , color: Colors.grey[800]),)
                    ],
                  ),
                );
              } 
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text("Best Selling" , 
              style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),
              ),
          ),
          GridView.builder(
            itemCount: items.length,
           physics: NeverScrollableScrollPhysics(),
           shrinkWrap: true, 
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 , mainAxisExtent: 240),
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ItemDetails(data: items[i], addToCart: addToCart),
                  ));
              },
              child: Card(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.grey[200],
                  width: 300,
                  child: Image.asset(items[i]["image"] , height: 115,fit: BoxFit.fill),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(items[i]["title"], style: TextStyle(fontSize: 17 , fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(items[i]["subtitle"], style: TextStyle(fontSize: 14 , color: Colors.grey)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(items[i]["details"], style: TextStyle(fontSize: 14 , color: Colors.grey)),
                  ), 
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(items[i]["price"], style: TextStyle(fontSize: 17 , color: Colors.orange , fontWeight: FontWeight.bold)),
                  )
              ],),
              ),
            );
          }, 
          )
        ]),
      ),
    );
  }
}
