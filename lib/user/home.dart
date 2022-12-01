import 'package:flutter/material.dart';

import '../botton_nav_bar/all.dart';

class userDefaultHome extends StatefulWidget {
  const userDefaultHome({Key? key}) : super(key: key);


  @override
  State<userDefaultHome> createState() => _DefaultHomeState();
}

class _DefaultHomeState extends State<userDefaultHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 12, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          child: ListView(
            padding: EdgeInsets.all(18),
            children: [
              SizedBox(height: 20,),
              Text("Haatbazar", style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 16,),
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search,color: Colors.grey,),
                      border: InputBorder.none,
                      hintText: 'Search',

                    ),
                  ),
                ),
              ),

              SizedBox(height: 15,),
              //category
              Text("Our Category",style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 15,),

              //tabbar
              Container(
                child: TabBar(
                  isScrollable: true,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.blueGrey,
                  controller: _tabController,
                  tabs: [
                    Tab(text: "All",),
                    Tab(text: "Clothes",),
                    Tab(text: "Agriculture",),
                    Tab(text: "Brauty & Personal Care",),
                    Tab(text: "Food & Beverage",),
                    Tab(text: "Furniture",),
                    Tab(text: "Gifts & Crafts",),
                    Tab(text: "Electronic",),
                    Tab(text: "Health & Medical",),
                    Tab(text: "Machinery",),
                    Tab(text: "Jewelry",),
                    Tab(text: "Tools & Hardware",),
                  ],
                ),
              ),

              SizedBox(height: 10,),
              Text("Just for you",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 10,),
              //tabbar view
              Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height -20,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Allproductlist(),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),

                  ],
                ),
              ),

            ],
          ),

        ),
      ),
    );
  }
}
