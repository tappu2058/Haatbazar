import 'package:flutter/material.dart';

class VendorOnlinePayment extends StatefulWidget {
  const VendorOnlinePayment({Key? key}) : super(key: key);

  @override
  State<VendorOnlinePayment> createState() => _VendorOnlinePaymentState();
}

class _VendorOnlinePaymentState extends State<VendorOnlinePayment> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Online Payment"),backgroundColor: Colors.white,foregroundColor: Colors.black,),
          body: ListView(
            padding: EdgeInsets.all(17),
            children: [
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                height: 100,
                child: Card(
                  color: Colors.lightGreenAccent,
                  child: Center(child: Text("total Online Revenue",style: TextStyle(
                    fontSize: 24,
                  ),)),
                ),
              ),

              SizedBox(height: 20,),
              Text("Online Payments",style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),),
            ],
          ),
        )
    );
  }
}
