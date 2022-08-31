import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';


class VendorCreatePost extends StatefulWidget {
  const VendorCreatePost({Key? key}) : super(key: key);

  @override
  State<VendorCreatePost> createState() => _VendorCreatePostState();
}

class _VendorCreatePostState extends State<VendorCreatePost> {

  List<String> listitems = ["Clothes", "Agriculture","Brauty & Personal Care","Food & Beverage"
      "Furniture","Gifts & Crafts","Electronic","Health & Medical","Machinery","Jewelry","Tools & Hardware"];
  String selectval = "Clothes";


  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? imageFileList = [];

  Future<void> selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: ListView(
              padding: EdgeInsets.all(20),
              children: [
                SizedBox(height: 25,),
                Text("Create your post",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                ),),

                SizedBox(height: 15,),
                DropdownButton(
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
                  decoration: InputDecoration(
                    hintText: 'Product name',
                    labelText: 'Product',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Product Price',
                    labelText: 'Price',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Quantity',
                    labelText: 'Quantity',
                  ),
                ),

                MaterialButton(
                    color: Colors.blue,
                    child: const Text(
                        "Pick Images from Gallery",
                        style: TextStyle(
                            color: Colors.white70, fontWeight: FontWeight.bold
                        )
                    ),
                    onPressed: () {
                      selectImages();
                    }
                ),
                SizedBox(height: 20,),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: imageFileList!.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            // return FileImage(File(imageFileList![index].path));
                            return Image.file(File(imageFileList![index].path), fit: BoxFit.cover);
                          }
                      ),
                    )
                ),

                MaterialButton(
                  color: Colors.orange,
                  onPressed: (){},
                    child: Text("Post",style: TextStyle(
                      fontSize: 19
                    ),)
                ),
              ]
          ),
        )
    );
  }
}

