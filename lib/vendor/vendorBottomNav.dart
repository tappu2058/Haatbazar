import 'package:flutter/material.dart';
import 'package:haatbazarv1/vendor/vendorCreatePost.dart';
import 'package:haatbazarv1/vendor/vendorHome.dart';
import 'package:haatbazarv1/vendor/vendorNotification.dart';
import 'package:haatbazarv1/vendor/vendorProfile.dart';
import 'package:haatbazarv1/vendor/vendorTrending.dart';


class VendorBottomNav extends StatefulWidget {
  const VendorBottomNav({Key? key}) : super(key: key);

  @override
  State<VendorBottomNav> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<VendorBottomNav> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    VendorHome(),
    VendorTranding(),
    VendorCreatePost(),
    VendorNotification(),
    VendorProfile(),
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
            icon: Icon(Icons.add),
            label: 'Create',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
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