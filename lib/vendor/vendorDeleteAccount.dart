import 'package:flutter/material.dart';

class VendorDeleteAccount extends StatefulWidget {
  const VendorDeleteAccount({Key? key}) : super(key: key);

  @override
  State<VendorDeleteAccount> createState() => _VendorDeleteAccountState();
}

class _VendorDeleteAccountState extends State<VendorDeleteAccount> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Delete account"),
          backgroundColor: Colors.white,foregroundColor: Colors.black,),

        body: ListView(
          padding: EdgeInsets.all(15),
          children: [
            Text("Why are you deleteing Haatbazar?",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 20,),
            Text("We are sorry to see you go! We would love to know why you want to delete your account,"
                "So we can improve the ap and support our community"),


          ],
        ),
      ),
    );
  }
}
