import 'dart:convert';
import 'package:api_app1/peoplemodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;



class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  Future <List<PeopleModel>> getapeople() async {
    List<PeopleModel> listPoeple = [];
    var url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    // print(url);
    // print(url);
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
   print(responseBody);

    for (var r in responseBody) {
      listPoeple.add(PeopleModel(
          id:     r["id"],
          avatar: r["avatar"],
          name:   r["name"],
          date:   r["date"],
          amount: r["amount"] )
      );

      // print("responseBody====>${listPost[0]}"
    }
    return listPoeple;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UserScreen"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getapeople(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return (snapshot.data == null) ? Text("wait..........") :

          ListView.builder(
            itemCount: snapshot.data.lengh,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: Image.network(snapshot.data[index].avatar),
                  title:  Text(snapshot.data[index].name),
                  subtitle: Text(snapshot.data[index].date),
                  trailing: Text(snapshot.data[index].amount),

                ),
              );
            },);
        },),
    );
  }
}
