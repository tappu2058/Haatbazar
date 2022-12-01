import 'package:flutter/material.dart';

class Discription extends StatefulWidget {
  const Discription({Key? key}) : super(key: key);

  @override
  State<Discription> createState() => _DiscriptionState();
}

class _DiscriptionState extends State<Discription> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              SizedBox(height: 60,),

            ],
          ),
        )
    );
  }
}
