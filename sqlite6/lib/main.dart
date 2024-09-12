import 'package:flutter/material.dart';
import 'package:sqlite6/homepage.dart';


void main() {
  runApp(MyApp());

}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageWidget(),
    );
  }
}
