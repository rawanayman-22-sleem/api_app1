import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'includecomment.dart';


class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}
class _CommentScreenState extends State<CommentScreen> {

Future <List<Inculde>> getainclude() async {
  List<Inculde> listInclude = [];
  var url = Uri.parse("https://jsonplaceholder.typicode.com/comments");
  // print(url);
  // print(url);
  var response = await http.get(url);
  var responseBody = jsonDecode(response.body);
  // print(responseBody);

  for (var r in responseBody) {
    listInclude.add(Inculde(
          name:   r["name"],
          id:     r["id"],
          email:  r["email"],
          body:   r["body"]));

      // print("responseBody====>${listcomment}");
      return listInclude;
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Comment"),
          centerTitle: true,
         ),
        body: FutureBuilder(
          future: getainclude(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return (snapshot.data == null) ? CircularProgressIndicator() :
            ListView.builder(
              itemCount:snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
              itemCount:snapshot.data.length; {
                return Card(
                        child: ListTile(
                          leading: Text("${snapshot.data[index].id}"),
                          trailing: Text("${snapshot.data[index].email}"),
                          subtitle: Text("${snapshot.data[index].body}"),
                          title: Text(snapshot.data[index].name),
      ),
      );
      }
      },);
      ),
      );
      }
    }