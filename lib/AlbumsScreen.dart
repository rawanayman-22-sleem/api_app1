import 'dart:convert';
import 'package:api_app1/photopeople.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
//import 'photopeople.dart';


class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  Future <List<PhotoPeople>> getaphoto() async {
    List<PhotoPeople> listPost = [];
    var url = Uri.parse("https://jsonplaceholder.typicode.com/albums");
    // print(url);
    // print(url);
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    print(responseBody);

    for (var r in responseBody) {
      listPost.add(PhotoPeople(
        userId:  r["userId"],
        id:    r["id"],
        title: r["title"],
      ));

      // print("responseBody====>${listPost[0]}"
    }
    return listPost;
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Albums"),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: getaphoto(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return (snapshot.data == null) ? Text("wait..........") :

            ListView.builder(
              itemCount: snapshot.data.lengh,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: Text(snapshot.data[index].postId),
                    title: Text(snapshot.data[index].title),

                  ),
                );
              },);
          },),
      );
    }
}
