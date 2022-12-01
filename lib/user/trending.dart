import 'package:flutter/material.dart';

class Usertredding extends StatefulWidget {
  const Usertredding({Key? key}) : super(key: key);

  @override
  State<Usertredding> createState() => _MytreddingState();
}

class _MytreddingState extends State<Usertredding> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: ListView(
            padding: EdgeInsets.all(20),
            children: [
              SizedBox(height: 30,),
              Text("No data available", style: TextStyle(
                fontSize: 21,
              ),),
            ],
          ),
        )
    );
  }
}
