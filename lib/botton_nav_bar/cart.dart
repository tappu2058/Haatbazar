import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/UserData.dart';

class Defaultcart extends StatefulWidget {
  const Defaultcart({Key? key}) : super(key: key);

  @override
  State<Defaultcart> createState() => _DefaultcartState();
}
class _DefaultcartState extends State<Defaultcart> {
  List<UserData> userpass = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getuserdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Phase"),
      ),
      body: Container(
        color: Colors.amber,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder<List<UserData>>(
          future: _getUserData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Container(
                      color: Colors.white,
                      child: const Text("failed to parse data")));
            } else if (snapshot.hasData && snapshot.data!.length > 0) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return _getRows(snapshot.data![index]);
                  });
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
  Widget _getRows(UserData onlineRiders) {
    return Card(
      elevation: 5.0,
      child: Container(
        child: Text(onlineRiders.name ?? ""),
      ),
    );
  }


  Future<List<UserData>> _getUserData() async {
    var request = http.Request('GET', Uri.parse('http://10.10.40.67:8000/api/userpass'));

    http.StreamedResponse response = await request.send();
    var jsonString = await http.Response.fromStream(response);

    final category = userDataFromJson(jsonString.body);
    print("Json data: $jsonString");

    if (response.statusCode == 200) {
      userpass.add(category);
    } else {
      print(response.reasonPhrase);
    }
    return userpass;
  }
}

