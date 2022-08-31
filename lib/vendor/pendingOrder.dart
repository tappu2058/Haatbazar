import 'package:flutter/material.dart';

class VendorPendingOrders extends StatefulWidget {
  const VendorPendingOrders({Key? key}) : super(key: key);

  @override
  State<VendorPendingOrders> createState() => _VendorPendingOrdersState();
}

class _VendorPendingOrdersState extends State<VendorPendingOrders> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Pending Orders"),backgroundColor: Colors.white,foregroundColor: Colors.black,),
          body: ListView(
            padding: EdgeInsets.all(17),
            children: [
              SizedBox(height: 25,),
              Center(
                  child: Text("Your Pending orders",style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),)
              ),
            ],
          ),
        )
    );
  }
}
