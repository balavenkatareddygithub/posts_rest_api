import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posts_rest_api/homePage.dart';

void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.grey,
        primarySwatch: Colors.cyan,
      ),
      home:HomePage(),
    );
  }
}
