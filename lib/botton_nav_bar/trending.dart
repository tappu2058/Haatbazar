import 'package:flutter/material.dart';

class Mytredding extends StatefulWidget {
  const Mytredding({Key? key}) : super(key: key);

  @override
  State<Mytredding> createState() => _MytreddingState();
}

class _MytreddingState extends State<Mytredding> {
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
