import 'package:flutter/material.dart';

import 'botton_nav_bar/bottomnav.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'bottomnav',
    routes: {'bottomnav':(context)=>DeaultNav()},
  ));
}
