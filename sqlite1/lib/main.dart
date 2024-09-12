import 'package:flutter/material.dart';
import 'DatabaseHelper.dart';

void main() {
  final dbHelper = DatabaseHelper();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Demo',
      home: HomePage(),
    );
  }
}
final dbHelper = DatabaseHelper();
class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Inserting data
            await dbHelper.insert({
              'name': 'John',
              'age': 30,
            });

            // Querying all data
            List<Map<String, dynamic>> rows = await dbHelper.queryAll();
            print(rows);
          },
          child: Text('Perform SQLite Operations'),
        ),
      ),
    );
  }
}
