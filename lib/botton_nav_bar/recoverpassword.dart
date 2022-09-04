import 'package:flutter/material.dart';
import 'package:haatbazarv1/botton_nav_bar/profile.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({Key? key}) : super(key: key);

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController passwordcontroller = new TextEditingController();
  final TextEditingController confirmpasswordcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Recover Password"),backgroundColor: Colors.white,foregroundColor: Colors.orange,),
          body: Form(
            key: _formkey,
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                SizedBox(height: 50,),
                //password
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
                    _recoverpassword();


                  },
                  child: Text("Reset",style: TextStyle(
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
  void _recoverpassword(){
    if(_formkey.currentState!.validate()){
      Navigator.push(context,
        MaterialPageRoute(builder: (context)=>Myprofile()),
      );
    }
    else{

    }
  }
}
