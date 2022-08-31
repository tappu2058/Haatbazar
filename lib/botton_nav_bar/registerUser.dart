import 'package:flutter/material.dart';
class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _userName = '';
  String _password = '';
  String _confirmPassword = '';

  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_userName);
      debugPrint(_password);
      debugPrint(_confirmPassword);

      /*
      Continute proccessing the provided information with your own logic
      such us sending HTTP requests, savaing to SQLite database, etc.
      */
    }
  }
  bool _isObscure = true;
  bool _isObscuree = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Text("Create Account for Customers"),
                      ),
                      /// Eamil
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
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
                        onChanged: (value) => _userEmail = value,
                      ),
                      SizedBox(height: 20,),
                      /// username
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                            labelText: 'Username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'This field is required';
                          }
                          if (value.trim().length < 4) {
                            return 'Username must be at least 4 characters in length';
                          }
                          // Return null if the entered username is valid
                          return null;
                        },
                        onChanged: (value) => _userName = value,
                      ),
                      SizedBox(height: 20,),
                      /// Password
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            prefixIcon: Icon(Icons.lock,color: Colors.grey,),
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
                              borderRadius: BorderRadius.circular(10.0),
                            )
                        ),
                        obscureText: _isObscure,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'This field is required';
                          }
                          if (value.trim().length < 8) {
                            return 'Password must be at least 8 characters in length';
                          }
                          // Return null if the entered password is valid
                          return null;
                        },
                        onChanged: (value) => _password = value,
                      ),
                      SizedBox(height: 20,),
                      /// Confirm Password
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                            suffixIcon: IconButton(
                                icon: Icon(
                                    _isObscuree ? Icons.visibility : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscuree = !_isObscuree;
                                  });
                                }),
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                        ),
                        obscureText: _isObscuree,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }

                          if (value != _password) {
                            return 'Confimation password does not match the entered password';
                          }

                          return null;
                        },
                        onChanged: (value) => _confirmPassword = value,
                      ),
                      const SizedBox(height: 20),
                      //sign in
                      Container(
                          alignment: Alignment.centerRight,
                          child: OutlinedButton(
                              onPressed: _trySubmitForm,
                              child: const Text('Sign Up')))
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
