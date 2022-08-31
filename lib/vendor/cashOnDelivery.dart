import 'package:flutter/material.dart';

class VendorCashOnDelivery extends StatefulWidget {
  const VendorCashOnDelivery({Key? key}) : super(key: key);

  @override
  State<VendorCashOnDelivery> createState() => _VendorCashOnDeliveryState();
}

class _VendorCashOnDeliveryState extends State<VendorCashOnDelivery> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Cash on delivery"),backgroundColor: Colors.white,foregroundColor: Colors.black,),
          body: ListView(
            padding: EdgeInsets.all(17),
            children: [
              SizedBox(height: 25,),
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                height: 100,
                child: Card(
                  color: Colors.lightGreenAccent,
                  child: Center(child: Text("Total cash on delivery revenue",style: TextStyle(
                    fontSize: 24,
                  ),)),
                ),
              ),

              SizedBox(height: 20,),
              Text("Cash on Delevery Payments",style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),),
            ],
          ),
        )
    );
  }
}
