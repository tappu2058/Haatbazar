import 'package:flutter/material.dart';

class Allproductlist extends StatefulWidget {
  const Allproductlist({Key? key}) : super(key: key);

  @override
  State<Allproductlist> createState() => _AllproductlistState();
}

class _AllproductlistState extends State<Allproductlist> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Column(
                      children: [
                        SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                image: DecorationImage(
                                  image: AssetImage("assets/productimage/jutto.jpg"),

                                )
                            ),
                          ),height: 96,
                        ),
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("Shoes",style: TextStyle(
                                    fontSize: 17
                                ),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("1850",style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.red,
                                      decoration: TextDecoration.lineThrough,
                                    ),),
                                    Text("(1700)",style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.green
                                    ),),
                                  ],
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*1,
                                  child: ElevatedButton( onPressed: (){},
                                      child: Icon(Icons.shopping_cart)),
                                ),
                              ],
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Column(
                      children: [
                        SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                image: DecorationImage(
                                  image: AssetImage("assets/productimage/bag.jpg"),

                                )
                            ),
                          ),height: 96,
                        ),
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("Bag",style: TextStyle(
                                    fontSize: 17
                                ),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("850",style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.red,
                                      decoration: TextDecoration.lineThrough,
                                    ),),
                                    Text("(700)",style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.green
                                    ),),
                                  ],
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*1,
                                  child: ElevatedButton( onPressed: (){},
                                      child: Icon(Icons.shopping_cart)),
                                ),
                              ],
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Column(
                      children: [
                        SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                image: DecorationImage(
                                  image: AssetImage("assets/productimage/jacket.jpg"),

                                )
                            ),
                          ),height: 96,
                        ),
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("Jacket",style: TextStyle(
                                    fontSize: 17
                                ),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("1650",style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.red,
                                      decoration: TextDecoration.lineThrough,
                                    ),),
                                    Text("(1300)",style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.green
                                    ),),
                                  ],
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*1,
                                  child: ElevatedButton( onPressed: (){},
                                      child: Icon(Icons.shopping_cart)),
                                ),
                              ],
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Column(
                      children: [
                        SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                image: DecorationImage(
                                  image: AssetImage("assets/productimage/topi.jpg"),

                                )
                            ),
                          ),height: 96,
                        ),
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("Cap",style: TextStyle(
                                    fontSize: 17
                                ),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("650",style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.red,
                                      decoration: TextDecoration.lineThrough,
                                    ),),
                                    Text("(600)",style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.green
                                    ),),
                                  ],
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*1,
                                  child: ElevatedButton( onPressed: (){},
                                      child: Icon(Icons.shopping_cart)),
                                ),
                              ],
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
