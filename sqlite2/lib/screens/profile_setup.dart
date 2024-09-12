import 'package:sqlite2/screens/user.dart';
import 'package:sqlite2/screens/userService.dart';
import 'package:flutter/material.dart';
import 'package:sqlite2/screens/text_field1.dart';

class ProfileSetup extends StatefulWidget {
  const ProfileSetup({super.key});

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  final _nameController = TextEditingController();
  final _phnoController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();

  bool _validateweight = false;
  bool _validatename = false;
  bool _validateage = false;
  bool _validatephno = false;

  var _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 400, // Limit the width for better readability
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField1(
                      controller: _nameController,
                      textt: 'Name',
                      errorText: _validatename ? 'Can\'t be empty' : null,
                    ),
                    SizedBox(height: 20),
                    TextField1(
                      controller: _phnoController,
                      textt: 'Phone',
                      errorText: _validatephno ? 'Can\'t be empty' : null,
                    ),
                    SizedBox(height: 20),
                    TextField1(
                      controller: _ageController,
                      textt: 'Age',
                      errorText: _validateage ? 'Can\'t be empty' : null,
                    ),
                    SizedBox(height: 20),
                    TextField1(
                      controller: _weightController,
                      textt: 'Weight',
                      errorText: _validateweight ? 'Can\'t be empty' : null,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              _nameController.text.isEmpty
                                  ? _validatename = true
                                  : _validatename = false;
                              _phnoController.text.isEmpty
                                  ? _validatephno = true
                                  : _validatephno = false;
                              _ageController.text.isEmpty
                                  ? _validateage = true
                                  : _validateage = false;
                              _weightController.text.isEmpty
                                  ? _validateweight = true
                                  : _validateweight = false;
                            });
                            if (_validatename == false &&
                                _validatephno == false &&
                                _validateweight == false &&
                                _validateage == false) {
                              var _user = User();
                              _user.name = _nameController.text;
                              _user.phone = _phnoController.text;
                              _user.age = _ageController.text;
                              _user.weight = _weightController.text;
                              var result = await _userService.SaveUser(_user);
                              print(result);
                            }
                          },
                          child: Text('Submit'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _nameController.clear();
                            _phnoController.clear();
                            _ageController.clear();
                            _weightController.clear();
                            setState(() {
                              _validatename = false;
                              _validatephno = false;
                              _validateage = false;
                              _validateweight = false;
                            });
                          },
                          child: Text('Clear'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
