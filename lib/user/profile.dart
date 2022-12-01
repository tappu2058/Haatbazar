import 'package:flutter/material.dart';

import '../botton_nav_bar/bottomnav.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 100,),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder)=>DeaultNav()),
              );
            },
              child: Icon(Icons.exit_to_app)),
        ],
      ),
    ));
  }
}
