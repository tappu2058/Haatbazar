import 'package:flutter/material.dart';

class VendorCancelOrder extends StatefulWidget {
  const VendorCancelOrder({Key? key}) : super(key: key);

  @override
  State<VendorCancelOrder> createState() => _VendorCancelOrderState();
}

class _VendorCancelOrderState extends State<VendorCancelOrder> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Cancelled Orders"),backgroundColor: Colors.white,foregroundColor: Colors.black,),
          body: ListView(
            padding: EdgeInsets.all(17),
            children: [
              SizedBox(height: 25,),
              Center(
                child: Text("Cancelled Orders",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),),
              ),
            ],
          ),
        )
    );
  }
}
