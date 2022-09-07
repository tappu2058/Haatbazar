import 'package:flutter/material.dart';

class Defaultcart extends StatefulWidget {
  const Defaultcart({Key? key}) : super(key: key);

  @override
  State<Defaultcart> createState() => _DefaultcartState();
}
class _DefaultcartState extends State<Defaultcart> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getuserdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Phase"),
      ),
      body: Container(
        color: Colors.amber,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        ),

    );
  }
}

