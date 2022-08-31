import 'package:flutter/material.dart';
import 'package:haatbazarv1/vendor/vendorDeleteAccount.dart';

class VendorManageAccount extends StatefulWidget {
  const VendorManageAccount({Key? key}) : super(key: key);

  @override
  State<VendorManageAccount> createState() => _VendorManageAccountState();
}

class _VendorManageAccountState extends State<VendorManageAccount> {
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
              Text("Phone Number"),
              SizedBox(height: 30,),
              Text("Email"),
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
