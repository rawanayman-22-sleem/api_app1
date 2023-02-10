import 'package:api_app1/AlbumsScreen.dart';
import 'package:api_app1/PostesScreen.dart';
import 'package:flutter/material.dart';

import 'CommentScreen.dart';
import 'UserScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API_APP1',
      theme: ThemeData(

        primarySwatch: Colors.purple,
      ),
      home: const CommentScreen(),
    );
  }
}


