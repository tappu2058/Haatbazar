import 'package:flutter/material.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({Key? key}) : super(key: key);

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Center(child: Text("Username")),backgroundColor: Colors.white,
        foregroundColor: Colors.black,automaticallyImplyLeading: false,),

      body: ListView(
        children: [
          SizedBox(height: 40,),
          Padding(
            padding: EdgeInsets.all(19),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.person,size: 50,),
                Text("Username",style: TextStyle(fontSize: 21),),
              ],
            ),
          ),

          SizedBox(height: 20,),
          Card(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  title: Text("Manage Account"),
                  leading: Icon(Icons.person),
                ),
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text("Privacy"),),
                ListTile(
                  leading: Icon(Icons.security),
                  title: Text("Security and Login"),),
              ],
            ),
          ),
          Card(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  title: Text("Reported issue"),
                  leading: Icon(Icons.report_problem),
                ),
                ListTile(
                  leading: Icon(Icons.feedback),
                  title: Text("Feedback"),),

              ],
            ),
          ),
          Card(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  title: Text("Deleted Account"),
                  leading: Icon(Icons.delete),
                ),
                ListTile(
                  leading: Icon(Icons.block),
                  title: Text("Banned Account"),),
                ListTile(
                  leading: Icon(Icons.security),
                  title: Text("Security and Login"),),
              ],
            ),
          ),
          Card(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  title: Text("Reported issue"),
                  leading: Icon(Icons.report_problem),
                ),
                ListTile(
                  leading: Icon(Icons.feedback),
                  title: Text("Feedback"),),

              ],
            ),
          ),
          Card(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  title: Text("Logout"),
                  leading: Icon(Icons.logout),
                ),

              ],
            ),
          ),
        ],
      ),
    ));
  }
}
