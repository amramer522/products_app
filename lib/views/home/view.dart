import 'package:flutter/material.dart';
import 'package:product_app/views/home/pages/favs/view.dart';
import 'package:product_app/views/home/pages/wallet/view.dart';

import 'pages/home/view.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pages = [
    HomePage(),
    WalletPage(),
    FavPage(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen"),),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap:(int index){
          currentPage = index;
          setState(() {

          });
        } ,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.monetization_on),label: "Wallet"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Fav"),
        ],
      ),
    );
  }
}
