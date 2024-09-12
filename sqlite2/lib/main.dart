import 'package:flutter/material.dart';
import 'package:sqlite2/screens/profile_setup.dart';
import 'login.dart';
import 'register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => RegisterPage(),
        // '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
