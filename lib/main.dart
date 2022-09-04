import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'botton_nav_bar/bottomnav.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'bottomnav',
    routes: {'bottomnav':(context)=>DeaultNav()},
  ));
}
