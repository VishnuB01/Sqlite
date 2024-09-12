import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  var _userNameController = TextEditingController();
  var _userContactController = TextEditingController();
  var _userDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new user"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add new User',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _userNameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Name",
                    labelText: 'Name'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _userContactController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Contact",
                    labelText: 'Contact'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _userDescriptionController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Description",
                    labelText: 'Description'),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    style:TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal,
                      textStyle: const TextStyle(fontSize: 15)
                    ),
                    child: const Text("Submit"),
                    ),
                  SizedBox(width: 10,),
                  TextButton(
                    onPressed: () {
                      _userDescriptionController.text="";
                      _userContactController.text="";
                      _userNameController.text="";

                    },
                    style:TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                        textStyle: const TextStyle(fontSize: 15)
                    ),
                    child: const Text("Clear Details"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
