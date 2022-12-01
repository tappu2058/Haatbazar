import 'package:flutter/material.dart';

class Defaultcart extends StatefulWidget {
  const Defaultcart({Key? key}) : super(key: key);

  @override
  State<Defaultcart> createState() => _DefaultcartState();
}
class _DefaultcartState extends State<Defaultcart> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            SizedBox(height: 50,),
            Text("Your Items",style: TextStyle(
              fontSize: 24,
              color: Colors.green,
            ),),
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.3,
                  child: Text("Product",style: TextStyle(
                    fontSize: 24,
                    color: Colors.black
                  ),),
                ),
                Text("Items",style: TextStyle(
                    fontSize: 24,
                    color: Colors.black
                ),),
                Text("Price",style: TextStyle(
                    fontSize: 24,
                    color: Colors.black
                ),),
              ],
            ),

            Container(
              height: 100,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.3,
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          image: DecorationImage(
                            image: AssetImage("assets/productimage/topi.jpg"),
                          )
                      ),
                    ),

                    Container(
                      child: Text("Cap",style: TextStyle(
                        fontSize: 19,
                      ),),
                    ),
                    Container(
                      child: Text("600",style: TextStyle(
                        fontSize: 19,
                      ),),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.3,
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          image: DecorationImage(
                            image: AssetImage("assets/productimage/jutto.jpg"),
                          )
                      ),
                    ),

                    Container(
                      child: Text("Shoes",style: TextStyle(
                        fontSize: 19,
                      ),),
                    ),
                    Container(
                      child: Text("1700",style: TextStyle(
                        fontSize: 19,
                      ),),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.3,
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          image: DecorationImage(
                            image: AssetImage("assets/productimage/bag.jpg"),
                          )
                      ),
                    ),

                    Container(
                      child: Text("Bag",style: TextStyle(
                        fontSize: 19,
                      ),),
                    ),
                    Container(
                      child: Text("700",style: TextStyle(
                        fontSize: 19,
                      ),),
                    )
                  ],
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.3,
                  child: Text("", style: TextStyle(
                    fontSize: 23,
                  ),),
                ),
                Text("Total", style: TextStyle(
                  fontSize: 23,
                ),),
                Text("3000", style: TextStyle(
                  fontSize: 23,
                ),),
              ],
            ),

            SizedBox(height: 60,),
            ElevatedButton(onPressed: (){},
                child: Text("Check Out"))
          ],
        ),
        ),

    );
  }
}

