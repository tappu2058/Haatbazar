import 'package:flutter/material.dart';

class VendorSecurityAndLogin extends StatefulWidget {
  const VendorSecurityAndLogin({Key? key}) : super(key: key);

  @override
  State<VendorSecurityAndLogin> createState() => _VendorSecurityAndLoginState();
}

class _VendorSecurityAndLoginState extends State<VendorSecurityAndLogin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Security and Login"),backgroundColor: Colors.white,foregroundColor: Colors.black,),
          body: ListView(
            padding: EdgeInsets.all(15),
            children: [
              Text("Login",style: TextStyle(
                color: Colors.black45,
                fontSize: 20,
              ),),
              SizedBox(height: 20,),
              Text("Change Password",style: TextStyle(
                fontSize: 21,
              ),),
              SizedBox(height: 10,),
              Divider(color: Colors.black,),
              SizedBox(height: 10,),
              Text("Two-factor authentication",style: TextStyle(
                color: Colors.black45,
                fontSize: 20,
              ),),
              SizedBox(height: 20,),
              Text("Use two factor authentication",style: TextStyle(
                fontSize: 21,
              ),),
            ],
          ),
        )
    );
  }
}
