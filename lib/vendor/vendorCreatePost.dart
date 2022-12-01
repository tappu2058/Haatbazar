import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';


class VendorCreatePost extends StatefulWidget {
  const VendorCreatePost({Key? key}) : super(key: key);

  @override
  State<VendorCreatePost> createState() => _VendorCreatePostState();
}

class _VendorCreatePostState extends State<VendorCreatePost> {
  final TextEditingController addproduct = new TextEditingController();
  final TextEditingController addprice = new TextEditingController();
  final TextEditingController addquantity = new TextEditingController();
  final TextEditingController addimage = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  List<String> listitems = ["Clothes", "Agriculture","Brauty & Personal Care","Food & Beverage"
      "Furniture","Gifts & Crafts","Electronic","Health & Medical","Machinery","Jewelry","Tools & Hardware"];
  String selectval = "Clothes";




  String base64image = "";
  File? _image;
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
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              )
                          ),
                          hint: Text("Select Category"),
                          value: selectval,
                          onChanged: (value) {
                            setState(() {
                              selectval = value.toString();
                            });
                          },
                          items: listitems.map((itemone) {
                            return DropdownMenuItem(value: itemone, child: Text(itemone));
                          }).toList(),
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: addproduct,
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
                            onPressed: (){
                              post();
                            },
                            child: Text("Post",style: TextStyle(
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


  void post(){
    if(_formkey.currentState!.validate()){

    }
  }
}

