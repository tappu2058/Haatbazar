import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Forgetpass extends StatefulWidget {
  const Forgetpass({Key? key}) : super(key: key);

  @override
  State<Forgetpass> createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> {

  final _formkey = GlobalKey<FormState>();
  final TextEditingController phonecontroler = new TextEditingController();
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
                Text("Enter your phone number",style: TextStyle(
                  fontSize: 30,
                  color: Colors.orange,
                ),),
                SizedBox(height: 20,),
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
                MaterialButton(
                  onPressed: (){
                    _forgetpass();
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
  void _forgetpass(){
    if(_formkey.currentState!.validate()){

    }
  }
}
