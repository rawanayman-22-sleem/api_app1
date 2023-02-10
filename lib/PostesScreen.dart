import 'dart:convert';
import 'package:api_app1/postscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
//import 'postesscreen.dart';


class PostesScreen extends StatefulWidget {
  const PostesScreen({Key? key}) : super(key: key);

  @override
  State<PostesScreen> createState() => _PostesScreenState();
}

class _PostesScreenState extends State<PostesScreen> {
  Future <List<PostsModel>> getaposts() async {
    List<PostsModel> listPost = [];
    var url = Uri.parse("https://jsonplaceholder.typicode.com/postes");
     // print(url);
     // print(url);
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
 //   print(responseBody);

    for (var r in responseBody) {
      listPost.add(PostsModel(
          userId2: r["userId2"],
          id2:     r["id2"],
          title2:  r["title2"],
          body2:   r["body2"]));

     // print("responseBody====>${listPost[0]}"
       }
      return listPost;
    }
    // @override
    // void initState() {
    //   getaposts();
    //   super.initState();
    // }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Postes Screen"),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder(
            future: getaposts(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return (snapshot.data==null)? CircularProgressIndicator(): ListView.builder(
                itemCount:snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {

                  return Card(
                      color: Colors.deepPurpleAccent,
                      child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: ListTile(
                       leading: Text("${snapshot.data[index].id}"),
                       title: Text("${snapshot.data[index].title}"),
                       subtitle: Text("${snapshot.data[index].body}"),
                  ),
                      ));
                },);
            },),
        ),
      );
    }
  }

