import 'package:flutter/material.dart';
import 'package:haatbazarv1/botton_nav_bar/cart.dart';
import 'package:haatbazarv1/botton_nav_bar/home.dart';
import 'package:haatbazarv1/botton_nav_bar/trending.dart';
import 'package:haatbazarv1/user/trending.dart';

import 'cart.dart';
import 'home.dart';


class userDeaultNav extends StatefulWidget {
  const userDeaultNav({Key? key}) : super(key: key);

  @override
  State<userDeaultNav> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<userDeaultNav> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    userDefaultHome(),
    Usertredding(),
    UserDefaultcart(),
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
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Trending',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: 'Profile',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[100],
        onTap: _onItemTapped,
      ),
    );

  }
}
