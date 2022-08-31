import 'package:flutter/material.dart';
import 'package:haatbazarv1/vendor/pendingOrder.dart';
import 'package:haatbazarv1/vendor/processingOrder.dart';
import '../botton_nav_bar/bottomnav.dart';
import 'cancelOrder.dart';
import 'cashOnDelivery.dart';
import 'completedOrder.dart';
import 'onlinePayment.dart';

class VendorHome extends StatefulWidget {
  const VendorHome({Key? key}) : super(key: key);

  @override
  State<VendorHome> createState() => _VendorHomeState();
}

class _VendorHomeState extends State<VendorHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Center(child: const Text("Dashboard")),
            backgroundColor: Colors.white,foregroundColor: Colors.black,),
          drawer: Drawer(child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 40,),
              ListTile(leading: Icon(Icons.person,size: 60,),),
              ListTile(leading: Text("@username",textAlign: TextAlign.center,),),

              Divider(
                color: Colors.black,
              ),

              ListTile(
                title: Text("Orders",style: TextStyle(
                  color: Colors.black45,
                ),),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>VendorPendingOrders()),
                  );
                },
                child: ListTile(
                  title: Text("Pending Order"),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>VendorProsessingOrder()),
                  );
                },
                child: ListTile(
                  title: Text("Processing Order"),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>VendorCompletedOrder()),
                  );
                },
                child: ListTile(
                  title: Text("Completed Orders"),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>VendorCancelOrder()),
                  );
                },
                child: ListTile(
                  title: Text("Cancelled Orders"),
                ),
              ),

              Divider(
                color: Colors.black,
              ),

              ListTile(
                title: Text("Payments",style: TextStyle(
                  color: Colors.black45,
                ),),
              ),


              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>VendorOnlinePayment()),
                  );
                },
                child: ListTile(
                  title: Text("Online Payment"),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>VendorCashOnDelivery()),
                  );
                },
                child: ListTile(
                  title: Text("Cash on delivery"),
                ),
              ),

              Divider(
                color: Colors.black,
              ),

              ListTile(
                title: GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>DeaultNav()),
                      );
                    },
                    child: Text("Logout")
                ),
              ),


            ],
          ),),
          body: ListView(
            padding: EdgeInsets.all(15),
            children: [
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width*0.3,
                      child: Card(
                        child: Center(child: Text("Sold Items")),
                      )
                  ),
                  Text("|"),
                  Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width*0.3,
                      child: Card(
                        child: Center(child: Text("Remaning Items")),
                      )
                  ),
                  Text("|"),
                  Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width*0.3,
                      child: Card(
                        child: Center(child: Text("Total Revenue")),
                      )
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Text("New Orders", style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),)
            ],
          ),
        )
    );
  }
}
