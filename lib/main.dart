import 'package:flutter/material.dart';
import 'package:protoGracket/widgets/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Code Land",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(accentColor: Colors.white70),
    );
  }
}
