import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:haatbazarv1/vendor/manageAccount.dart';
import 'package:haatbazarv1/vendor/reportProblem.dart';
import 'package:haatbazarv1/vendor/securityAndLogin.dart';
import 'package:haatbazarv1/vendor/vendorPrivacy.dart';

class VendorProfile extends StatefulWidget {
  const VendorProfile({Key? key}) : super(key: key);

  @override
  State<VendorProfile> createState() => _VendorProfileState();
}

class _VendorProfileState extends State<VendorProfile> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;
  final phone = FirebaseAuth.instance.currentUser!.phoneNumber;
  final fullname = FirebaseAuth.instance.currentUser!.displayName;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                ListTile(
                  leading: Text("Setting and Privacy",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ),
                ListTile(
                  leading: Text("Account",style: TextStyle(color: Colors.black54),),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>VendorManageAccount()),
                    );
                  },
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text("manage Account"),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>VendorPrivacy()),
                    );
                  },
                  child: ListTile(
                    leading: Icon(Icons.lock),
                    title: Text("Privacy"),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>VendorSecurityAndLogin()),
                    );
                  },
                  child: ListTile(
                    leading: Icon(Icons.security),
                    title: Text("Security and login"),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text("Share Profile"),
                ),
                Divider(
                  color: Colors.black,
                ),

                ListTile(
                  leading: Text("Support",style: TextStyle(color: Colors.black54),),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>VendorRepostProblem()),
                    );
                  },
                  child: ListTile(
                    leading: Icon(Icons.report_problem_outlined),
                    title: Text("Report a problem"),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text("Help Center"),
                ),
                Divider(
                  color: Colors.black,
                ),

                ListTile(
                  leading: Text("About",style: TextStyle(color: Colors.black54),),
                ),
                ListTile(
                  leading: Icon(Icons.ac_unit),
                  title: Text("Community guidelines"),
                ),
                ListTile(
                  leading: Icon(Icons.room_service_sharp),
                  title: Text("Terms of services"),
                ),
                ListTile(
                  leading: Icon(Icons.privacy_tip),
                  title: Text("Privacy Policy"),
                ),
                ListTile(
                  leading: Icon(Icons.copyright),
                  title: Text("Copyright policy"),
                ),

                Divider(
                  color: Colors.black,
                ),

                ListTile(
                  leading: Icon(Icons.logout_rounded),
                  title: Text("Logout"),
                ),
              ],
            ),
          ),
          appBar: AppBar(title: Center(child: Text("$email")),
            backgroundColor: Colors.white, foregroundColor: Colors.black,),
          body: ListView(
            padding: EdgeInsets.all(15),
            children: [
              SizedBox(height: 30,),
              Center(
                  child: Icon(Icons.person,size: 60,)
              ),
              Center(
                  child: Text('$email'),
              ),
              SizedBox(height: 20,),
              Text("Our Products",textAlign: TextAlign.center,style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),

              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width*0.3,
                    child: Card(
                      child: Center(child: Text("Image 1")),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width*0.3,
                    child: Card(
                      child: Center(child: Text("Image 1")),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width*0.3,
                    child: Card(
                      child: Center(child: Text("Image 1")),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width*0.3,
                    child: Card(
                      child: Center(child: Text("Image 1")),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width*0.3,
                    child: Card(
                      child: Center(child: Text("Image 1")),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width*0.3,
                    child: Card(
                      child: Center(child: Text("Image 1")),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width*0.3,
                    child: Card(
                      child: Center(child: Text("Image 1")),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width*0.3,
                    child: Card(
                      child: Center(child: Text("Image 1")),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width*0.3,
                    child: Card(
                      child: Center(child: Text("Image 1")),
                    ),
                  ),
                ],
              ),

            ],
          ),
        )
    );
  }
}
