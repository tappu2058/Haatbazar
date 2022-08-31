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
            children: [
              Text("Trending"),
            ],
          ),
        )
    );
  }
}
