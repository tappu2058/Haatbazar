import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:haatbazarv1/vendor/vendorDeleteAccount.dart';

import '../model/UserData.dart';

class VendorManageAccount extends StatefulWidget {
  const VendorManageAccount({Key? key}) : super(key: key);

  @override
  State<VendorManageAccount> createState() => _VendorManageAccountState();
}

class _VendorManageAccountState extends State<VendorManageAccount> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loginuser = UserModel();

  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then((value){
      this.loginuser = UserModel.formMap(value.data());
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Manage Account"),
            backgroundColor: Colors.white,foregroundColor: Colors.black,),

          body: ListView(
            padding: EdgeInsets.all(16),
            children: [
              SizedBox(height: 15,),
              Text("Account Information",style: TextStyle(color: Colors.black45),),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Phone Number"),
                  Text("${loginuser.Phone}"),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Email"),
                  Text("${loginuser.Email}"),
                ],
              ),
              SizedBox(height: 30,),
              Divider(color: Colors.black,),
              SizedBox(height: 20,),
              Text("Account Control",style: TextStyle(color: Colors.black45),),
              SizedBox(height: 30,),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>VendorDeleteAccount()),
                    );
                  },
                  child: Text("Delete Account")
              ),
            ],
          ),
        )
    );
  }
}
