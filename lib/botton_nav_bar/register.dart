import 'package:flutter/material.dart';
import 'package:haatbazarv1/botton_nav_bar/registerUser.dart';
import 'package:haatbazarv1/botton_nav_bar/registerVendor.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 150,
            ),
            Center(
              child: Card(
                color: Colors.grey[200],
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Text("What do you want?",style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 70),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 29.5),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RegisterUser()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width*0.8,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text("Create account for customer",style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 70),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 29.5),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RegisterVendor()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width*0.8,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text("Create account for Vendor",style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 70),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
