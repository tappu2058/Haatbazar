import 'package:flutter/material.dart';
import 'package:haatbazarv1/botton_nav_bar/bottomnav.dart';
class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Dashboard"),backgroundColor: Colors.white,foregroundColor: Colors.black,),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Profile"),
            ),
            Divider(color: Colors.black,),

            ListTile(
              title: Text("Shop details",style: TextStyle(color: Colors.black45),),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Shop List"),
            ),
            ListTile(
              leading: Icon(Icons.pending_actions),
              title: Text("Pending Payment"),
            ),
            ListTile(
              leading: Icon(Icons.circle),
              title: Text("Complete Payment"),
            ),

            Divider(color: Colors.black,),

            ListTile(
              leading: Icon(Icons.logout),
              title: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DeaultNav()),
                  );
                },
                  child: Text("Logout")),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width*0.45,
                child: Card(
                    child: Center(child: Text("Total Shop"))),
              ),

              Container(
                height: 100,
                width: MediaQuery.of(context).size.width*0.45,
                child: Card(
                    child: Center(child: Text("Total User"))),
              ),

            ],
          ),

          Container(
            padding: EdgeInsets.all(15),
            height: 100,
            width: MediaQuery.of(context).size.width*1,
            child: Card(
              color: Colors.lightGreen,
              child: Center(child: Text("Total Revenue")),
            ),
          ),

        ],
      ),
    ));
  }
}
