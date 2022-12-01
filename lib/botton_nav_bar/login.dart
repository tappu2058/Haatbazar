import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:haatbazarv1/admin/adminBottomNav.dart';
import 'package:haatbazarv1/botton_nav_bar/forgetPass.dart';
import 'package:haatbazarv1/botton_nav_bar/register.dart';
import 'package:haatbazarv1/user/userBottomNavBar.dart';
import 'package:haatbazarv1/vendor/vendorBottomNav.dart';

import '../model/UserData.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({Key? key}) : super(key: key);

  @override
  State<Mylogin> createState() => _MyloginState();

}

class _MyloginState extends State<Mylogin> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loginuser = UserModel();

  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value){
      this.loginuser = UserModel.formMap(value.data());
      setState(() {});
    });
  }

  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  var email = " ";
  var password = " ";
  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              SizedBox(height: 80,),
              Text("Welcome back",style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),),
              Text("Login",style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),),
              SizedBox(height: 20,),
              /// Eamil
              TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.mail,color: Colors.orange,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email address';
                  }
                  // Check if the entered email has the right format
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  // Return null if the entered email is valid
                  return null;
                },
              ),
              SizedBox(height: 20,),
              /// Password
              TextFormField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock,color: Colors.orange,),
                    suffixIcon: IconButton(
                        icon: Icon(
                            _isObscure ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
                obscureText: _isObscure,

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is required';
                  }
                  if (value.trim().length < 6) {
                    return 'Password must be at least 6 characters in length';
                  }
                  // Return null if the entered password is valid
                  return null;
                },
              ),
              SizedBox(height: 20,),

              //sign in
              Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.all(16),
                      ),
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          setState(() {
                            email = emailcontroller.text;
                            password = passwordcontroller.text;
                          });
                          userloin();
                        }
                      },
                      child: Text('Login',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),))),
              SizedBox(height: 20,),
              //forget password
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Forgetpass()),
                  );
                },
                child: Center(
                  child: Text("Forget Password",style: TextStyle(
                    color: Colors.orange,
                    fontSize: 17,
                  ),),
                ),
              ),

              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("If you don't have account "),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Register()),
                      );
                    },
                    child: Text("Click here",style: TextStyle(
                      color: Colors.orange,
                    ),),
                  ),
                ],
              ),
            ],
          ),
          ),
        ),
      );
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('Wrole') == "Admin") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AdminBottomNav(),
            ),
          );
        }
        else if (documentSnapshot.get('Wrole') == "Vendor") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => VendorBottomNav(),
            ),
          );
        }
        else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => UserBottomNavBar(),
            ),
          );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  userloin() async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      route();
    }
    on FirebaseException catch(error){
      if(error.code == 'user-not-found'){
        print("No user found");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orange,
          content: Text('No user found',style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
        ),);
      }
      else if(error.code == 'wrong-password'){
        print("Wrong password");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orange,
          content: Text('Wrong password',style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
        ),);
      }
      else{
        print("Login failed. Please try again.");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orange,
          content: Text('Login failed. Please try again.',style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
        ),);
      }
    }
  }
}
