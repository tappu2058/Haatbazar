import 'package:flutter/material.dart';
import 'package:haatbazarv1/botton_nav_bar/cart.dart';
import 'package:haatbazarv1/botton_nav_bar/home.dart';
import 'package:haatbazarv1/botton_nav_bar/trending.dart';

import 'login.dart';

class DeaultNav extends StatefulWidget {
  const DeaultNav({Key? key}) : super(key: key);

  @override
  State<DeaultNav> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<DeaultNav> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    DefaultHome(),
    Mytredding(),
    Defaultcart(),
    Mylogin()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Trending',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[100],
        onTap: _onItemTapped,
      ),
    );

  }
}
