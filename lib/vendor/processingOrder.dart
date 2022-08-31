import 'package:flutter/material.dart';

class VendorProsessingOrder extends StatefulWidget {
  const VendorProsessingOrder({Key? key}) : super(key: key);

  @override
  State<VendorProsessingOrder> createState() => _VendorProsessingOrderState();
}

class _VendorProsessingOrderState extends State<VendorProsessingOrder> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Processing Orders"),backgroundColor: Colors.white,foregroundColor: Colors.black,),
          body: ListView(
            padding: EdgeInsets.all(17),
            children: [
              SizedBox(height: 25,),
              Center(
                child: Text("Your Processing Orders",style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ],
          ),
        )
    );
  }
}
