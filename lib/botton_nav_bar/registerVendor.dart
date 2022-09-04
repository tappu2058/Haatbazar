import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterVendor extends StatefulWidget {
  const RegisterVendor({Key? key}) : super(key: key);

  @override
  State<RegisterVendor> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterVendor> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController Fullnamecontroller = new TextEditingController();
  final TextEditingController EmailController = new TextEditingController();
  final TextEditingController phonecontroler = new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();
  final TextEditingController confirmpasswordcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Form(
            key: _formkey,
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                SizedBox(height: 40,),
                Center(
                  child: Text("Welcome vendor to\nHaatbazar",textAlign: TextAlign.center,style: TextStyle(
                      fontSize: 35,
                      color: Colors.orange
                  ),),
                ),
                SizedBox(height: 16,),
                //fullname
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: Fullnamecontroller,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter your shop name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Fullname',
                      labelText: 'Fullname',
                      prefixIcon: Icon(Icons.person_rounded,color: Colors.orange,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),
                SizedBox(height: 20,),
                //email
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: EmailController,
                  validator: (value){
                    if(value!.isEmpty){
                      return ("Enter your email");
                    }
                    if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                      return ("Enter valid email address");
                    }
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
                //phone
                TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                  controller: phonecontroler,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter your phone number';
                    }
                    if(value.length!=10){
                      return ("Mobile Number must be of 10 digit");
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Phone number',
                      labelText: 'Phone number',
                      prefixIcon: Icon(Icons.phone,color: Colors.orange,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),
                SizedBox(height: 20,),
                //password
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  controller: passwordcontroller,
                  validator: (value){
                    if(value!.isEmpty){
                      return ("Enter your Password");
                    }
                    if (value.trim().length < 5) {
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
                    _registervendor();
                  },
                  child: Text("Register"),
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
  void _registervendor(){
    if(_formkey.currentState!.validate()){

    }
  }
}
