import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:haatbazarv1/botton_nav_bar/profile.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formkey = GlobalKey<FormState>();

  var password = " ";
  var confirmpass = " ";

  final TextEditingController  passwordcontroller = new TextEditingController();
  final TextEditingController  confirmpasswordcontroller = new TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text('Chance password'),backgroundColor: Colors.orange,foregroundColor: Colors.white,),
          body: Form(
            key: _formkey,
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                SizedBox(height: 60,),
                Text("Change your password",style: TextStyle(
                  fontSize: 28,
                  color: Colors.orange,
                ),),
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  controller: passwordcontroller,
                  validator: (value){
                    if(value!.isEmpty){
                      return ("Enter your Password");
                    }
                    if (value.trim().length < 6) {
                      return 'Password must be at least 6 characters in length';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'password',
                      prefixIcon: Icon(Icons.lock,color: Colors.orange,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),
                SizedBox(height: 20,),
                //confirm password
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: confirmpasswordcontroller,
                  obscureText: true,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Re-enter password";
                    }
                    if(value!=passwordcontroller.text){
                      return 'Password not match';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Confirm password',
                      labelText: 'Confirm password',
                      prefixIcon: Icon(Icons.person_rounded,color: Colors.orange,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),
                SizedBox(height: 20,),
                MaterialButton(
                  onPressed: (){
                    if(_formkey.currentState!.validate()){
                      setState(() {
                        password = passwordcontroller.text;
                        confirmpass = confirmpasswordcontroller.text;
                      });
                      _passwordchange();
                    }
                  },
                  child: Text("Change Password",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
                  color: Colors.orange,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),

                ),
              ],
            ),
          ),
        )
    );
  }

  _passwordchange() async{
    try{
      await currentUser!.updatePassword(password);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Myprofile()),
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.orange,
        content: Text("Your password has been changed..",style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
      ));
    }
    on FirebaseException catch(error){

    }
  }
  @override
  void dispose() {
    passwordcontroller.dispose();
    confirmpasswordcontroller.dispose();
    super.dispose();
  }
}
