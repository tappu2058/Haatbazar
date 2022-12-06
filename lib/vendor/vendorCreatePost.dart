import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import '../model/addproduct.dart';




class VendorCreatePost extends StatefulWidget {
  const VendorCreatePost({Key? key}) : super(key: key);

  @override
  State<VendorCreatePost> createState() => _VendorCreatePostState();
}

class _VendorCreatePostState extends State<VendorCreatePost> {
  final TextEditingController addcategory = new TextEditingController();
  final TextEditingController addproductt = new TextEditingController();
  final TextEditingController addprice = new TextEditingController();
  final TextEditingController adddiscoutedprice = new TextEditingController();
  final TextEditingController addquantity = new TextEditingController();
  final TextEditingController addimage = new TextEditingController();
  final storageRef = FirebaseStorage.instance.ref();
  final _formkey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  // List<String> listitems = ["Clothes", "Agriculture","Brauty & Personal Care","Food & Beverage"
  //     "Furniture","Gifts & Crafts","Electronic","Health & Medical","Machinery","Jewelry","Tools & Hardware"];
  // String selectval = "Clothes";




  bool loading = false;
  String base64image = "";
  File? _image;
  // firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  DatabaseReference databaseref = FirebaseDatabase.instance.ref('CreatePost');

  Future _getfromgallery() async{

    PickedFile? image;
    final pickedfile  = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedfile!= null){
      this.setState(() {
        _image = File(pickedfile!.path);
      });
    }else {
      if (kDebugMode) {
        print('No image selected.');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            child: Form(
                  key: _formkey,
                  child: ListView(
                      padding: EdgeInsets.all(20),
                      children: [
                        SizedBox(height: 35,),
                        Text("Add your product",style: TextStyle(
                          fontSize: 21,
                          color: Colors.green
                        ),),
                        SizedBox(height: 20,),
                        // DropdownButtonFormField(
                        //   decoration: InputDecoration(
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(15),
                        //       )
                        //   ),
                        //   hint: Text("Select Category"),
                        //   value: selectval,
                        //   onChanged: (value) {
                        //     setState(() {
                        //       selectval = value.toString();
                        //     });
                        //   },
                        //   items: listitems.map((itemone) {
                        //     return DropdownMenuItem(value: itemone, child: Text(itemone));
                        //   }).toList(),
                        // ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: addcategory,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter category';
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            ),
                            hintText: 'category',
                            labelText: 'category',
                          ),
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: addproductt,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter prodect name';
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            ),
                            hintText: 'Product name',
                            labelText: 'Product',
                          ),
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: addprice,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter price';
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            ),
                            hintText: 'Product Price',
                            labelText: 'Price',
                          ),
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: adddiscoutedprice,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter discounted price';
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            ),
                            hintText: 'Discounted Price',
                            labelText: 'Discounted Price',
                          ),
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: addquantity,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter quentity';
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            ),
                            hintText: 'Quantity',
                            labelText: 'Quantity',
                          ),
                        ),
                        SizedBox(height: 15,),

                        Container(
                          height: 300,
                          child: Column(
                            children: [
                              ElevatedButton(onPressed: (){
                                _getfromgallery();
                              }, child:
                              Text("Pick image",style: TextStyle(color: Colors.orange),),
                              ),
                              Expanded(child: buildGridview())
                            ],
                          ),
                        ),

                        MaterialButton(
                            color: Colors.orange,
                            onPressed: () async{
                              final mountainsRef = storageRef.child(DateTime.now().millisecondsSinceEpoch.toString()+".jpg");
                              try {

                                await mountainsRef.putFile(_image!, SettableMetadata(
                                  contentType: "image/jpeg",
                                )).then((p0) => {

                                p0.ref.getDownloadURL().then((url) => {
                                print("Image upload link : $url"),
                                  /// upload text code in firestore
                                  /// {}
                                  ///

                                })

                                });

                              } on FirebaseException catch (e) {
                                // ...
                                print(e);
                              }

                            },
                            child: Text("Upload",style: TextStyle(
                                fontSize: 19
                            ),)
                        ),
                      ]
                  ),
                ),

          ),
        )
    );
  }

  Widget buildGridview(){
    return Container(
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black26,
      ),
      child: _image != null ? Image.file(_image!.absolute) : Icon(Icons.image),
    );
  }

  Post() async{
    if (_formkey.currentState!.validate()) {
      FirebaseFirestore firebasefirestore = FirebaseFirestore.instance;
      User? user = auth.currentUser;

      Addproduct addproduct = Addproduct();
      //writing all values

      addproduct.Category = addcategory.text;
      addproduct.Uid = user?.uid;
      addproduct.Product = addproductt.text;
      addproduct.Proce = addprice.text;
      addproduct.DiscountPrice = adddiscoutedprice.text;
      addproduct.Quantity = addquantity.text;
      addproduct.image = "$url";

      await firebasefirestore
          .collection("CreatePost")
          .doc(user?.uid)
          .set(addproduct.toMap());
      Fluttertoast.showToast(msg: "Update Successfully");
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => VendorCreatePost()),
              (route) => false);
    }
  }

}

