import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haatbazarv1/botton_nav_bar/recoverpassword.dart';

class OTPforgetpass extends StatefulWidget {
  const OTPforgetpass({Key? key}) : super(key: key);

  @override
  State<OTPforgetpass> createState() => _OTPforgetpassState();
}

class _OTPforgetpassState extends State<OTPforgetpass> {

  final _formkey = GlobalKey<FormState>();
  final TextEditingController phonecontroler = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("OTP"),backgroundColor: Colors.white,foregroundColor: Colors.orange,),
          body: Form(
            key: _formkey,
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                SizedBox(height: 50),
                Text("Enter OTP",style: TextStyle(fontSize: 30,color: Colors.orange),),
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(4),
                  ],
                  controller: phonecontroler,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter OTP';
                    }
                    if(value.length!=4){
                      return ("OTP must be of 4 digit");
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'OTP',
                      labelText: 'Enter OTP',
                      prefixIcon: Icon(Icons.numbers,color: Colors.orange,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),
                SizedBox(height: 20,),
                MaterialButton(
                  onPressed: (){
                    _OTPforgetpass();

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
  void _OTPforgetpass(){
    if(_formkey.currentState!.validate()){
      Navigator.push(context,
        MaterialPageRoute(builder: (context)=>RecoverPassword()),
      );
    }
  }
}
