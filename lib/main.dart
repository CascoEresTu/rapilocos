import 'package:flutter/material.dart';
import 'package:rapilocos/services/authentication.dart';
import 'package:rapilocos/pages/root_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        color: Colors.blue,
        home: new RootPage(auth: new Auth()));
  }
}