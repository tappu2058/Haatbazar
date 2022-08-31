import 'package:flutter/material.dart';

class VendorCompletedOrder extends StatefulWidget {
  const VendorCompletedOrder({Key? key}) : super(key: key);

  @override
  State<VendorCompletedOrder> createState() => _VendorCompletedOrderState();
}

class _VendorCompletedOrderState extends State<VendorCompletedOrder> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Completed Orders"),backgroundColor: Colors.white,foregroundColor: Colors.black,),
          body: ListView(
            padding: EdgeInsets.all(17),
            children: [
              SizedBox(height: 20,),
              Center(
                child: Text("Your competed orders",style: TextStyle(
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
