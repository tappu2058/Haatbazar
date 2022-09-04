import 'package:flutter/material.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final _formkey = GlobalKey<FormState>();

  final Fullnamecontroller = new TextEditingController();
  final EmailController = new TextEditingController();
  final phonecontroler = new TextEditingController();
  final passwordcontroller = new TextEditingController();
  final confirmpasswordcontroller = new TextEditingController();
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
                  child: Text("Welcome to\nHaatbazar",style: TextStyle(
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
                      return 'Enter your full name';
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
                      return 'Enter your email';
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
                  controller: phonecontroler,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter your phone number';
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
                      return 'Enter password';
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
                      return 'Confirm your password';
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
                    onPressed: (){},
                  child: Text("Register"),
                  color: Colors.orange,
                )
              ],
            ),
          ),
        )
    );
  }
}
