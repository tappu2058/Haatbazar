import 'package:flutter/material.dart';

class VendorPrivacy extends StatefulWidget {
  const VendorPrivacy({Key? key}) : super(key: key);

  @override
  State<VendorPrivacy> createState() => _VendorPrivacyState();
}

class _VendorPrivacyState extends State<VendorPrivacy> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Privacy"),backgroundColor: Colors.white,foregroundColor: Colors.black,),
          body: ListView(
            padding: EdgeInsets.all(15),
            children: [
              Text("Discoverability",style: TextStyle(
                color: Colors.black45,
                fontSize: 20,
              ),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Private Account",style: TextStyle(
                    fontSize: 21,
                  ),),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        print(isSwitched);
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ],
              ),
              Text("Make your account private",style: TextStyle(
                color: Colors.black45,
              ),),

            ],
          ),
        )
    );
  }
}
