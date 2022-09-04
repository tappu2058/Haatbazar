import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haatbazarv1/botton_nav_bar/profile.dart';
class Forgetpass extends StatefulWidget {
  const Forgetpass({Key? key}) : super(key: key);

  @override
  State<Forgetpass> createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> {

  final _formkey = GlobalKey<FormState>();
  var email = " ";
  final TextEditingController emailcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Forget Password"),backgroundColor: Colors.white,foregroundColor: Colors.orange,),
          body: Form(
            key: _formkey,
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                SizedBox(height: 50,),
                Text("Reset link will be sent to your email ID",style: TextStyle(
                  fontSize: 30,
                  color: Colors.orange,
                ),),
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailcontroller,
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
                  decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.mail,color: Colors.orange,),
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
                        email = emailcontroller.text;
                      });
                      resetPassword();
                    }

                  },
                  child: Text("Submit",style: TextStyle(
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


  resetPassword() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.orange,
        content: Text('Password reset email has been sent',style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
      ));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Myprofile(),),
      );
    }
    on FirebaseException catch(error){
      if(error.code == 'user-not-found'){
        print("User not found");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orange,
          content: Text('User not found',style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
        ));
      }
    }
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    super.dispose();
  }
}
