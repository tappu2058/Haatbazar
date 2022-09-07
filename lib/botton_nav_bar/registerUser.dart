import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haatbazarv1/botton_nav_bar/profile.dart';
import '../model/UserData.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {

   bool _isObscure = true;
   bool _isObscure1 = true;
  final _formkey = GlobalKey<FormState>();


  final TextEditingController  Fullnamecontroller = new TextEditingController();
  final TextEditingController  EmailController = new TextEditingController();
  final TextEditingController  phonecontroler = new TextEditingController();
  final TextEditingController  passwordcontroller = new TextEditingController();
  final TextEditingController  confirmpasswordcontroller = new TextEditingController();
  final auth = FirebaseAuth.instance;
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
                  obscureText: _isObscure,
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
                      suffixIcon: IconButton(
                          icon: Icon(
                              _isObscure ? Icons.visibility : Icons.visibility_off,color: Colors.orange,),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          }),
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
                  obscureText: _isObscure1,
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
                      suffixIcon: IconButton(
                          icon: Icon(
                              _isObscure1 ? Icons.visibility : Icons.visibility_off,color: Colors.orange,),
                          onPressed: () {
                            setState(() {
                              _isObscure1 = !_isObscure1;
                            });
                          }),
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
                      SignUp(EmailController.text, passwordcontroller.text);
                      },
                  child: Text("Register",style: TextStyle(
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


  // register() async{
  //   if(password == confirmpass){
  //     try{
  //       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  //       print(userCredential);
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           backgroundColor: Colors.orange,
  //           content: Text("Register successfully",style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //             color: Colors.white
  //           ),),
  //       ));
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Myprofile(),),
  //       );
  //     }
  //     on FirebaseException catch(error){
  //       if(error.code == 'weak-password'){
  //         print("Weak password");
  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           backgroundColor: Colors.orange,
  //           content: Text("Weak password",style: TextStyle(
  //               fontWeight: FontWeight.bold,
  //               color: Colors.white
  //           ),),
  //         ));
  //
  //       }
  //       else if(error.code == 'email-already-in-use'){
  //         print("Account is already exist");
  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           backgroundColor: Colors.orange,
  //           content: Text("Account is already exist",style: TextStyle(
  //               fontWeight: FontWeight.bold,
  //               color: Colors.white
  //           ),),
  //         ));
  //       }
  //   }
  //   }
  //
  // }

  void SignUp(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password)
          .then((value) =>
      {
        postDetailsToFirestore()
      }).catchError((error) {
        if (error.code == 'weak-password') {
          print("Weak password");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orange,
            content: Text("Weak password", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),),
          ));
        }
        else if (error.code == 'email-already-in-use') {
          print("Account is already exist");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orange,
            content: Text("Account is already exist", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),),
          ));
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
      });
    }
  }

  postDetailsToFirestore() async{
    //calling firestore
    //callingusermodel
    //sending values
    FirebaseFirestore firebasefirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    UserModel usermodel = UserModel();
    //writing all values

    usermodel.Email = user!.email;
    usermodel.Uid = user.uid;
    usermodel.Fullname = Fullnamecontroller.text;
    usermodel.Phone = phonecontroler.text;
    usermodel.Password = passwordcontroller.text;
    usermodel.Wrole = 'User';

    await firebasefirestore
        .collection("users")
        .doc(user.uid)
        .set(usermodel.toMap());
    Fluttertoast.showToast(msg: "Account Create Successfully");
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Myprofile()),
            (route) => false);

  }
}
