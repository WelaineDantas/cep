import 'package:cep/views/HomePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CEP',
      home: HomePage(),
      theme: ThemeData(primaryColor: Color(0xff660066)),
      debugShowCheckedModeBanner: false,
    );
  }
}
