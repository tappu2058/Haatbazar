import 'package:flutter/material.dart';

class VendorRepostProblem extends StatefulWidget {
  const VendorRepostProblem({Key? key}) : super(key: key);

  @override
  State<VendorRepostProblem> createState() => _VendorRepostProblemState();
}

class _VendorRepostProblemState extends State<VendorRepostProblem> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Report a Problem"),backgroundColor: Colors.white,foregroundColor: Colors.black,),

          body: ListView(
            padding: EdgeInsets.all(17),
            children: [
              Text("Report a problem",style: TextStyle(
                color: Colors.black45,
              ),),
              SizedBox(height: 20,),
              TextFormField(
                maxLines: 8,
                decoration: InputDecoration(
                    hintText: 'Enter your Problem',
                    labelText: 'Problem',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                    )
                ),
              ),

              SizedBox(height: 25,),
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: EdgeInsets.all(16),
                  ),
                  onPressed: (){},
                  child: Text("Report",style: TextStyle(
                    fontSize: 20,
                  ),),
                ),
              )

            ],
          ),
        )
    );
  }
}
