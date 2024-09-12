import 'package:sqlite2/screens/user.dart';
import 'package:sqlite2/screens/userService.dart';
import 'package:flutter/material.dart';

class ProfileViewing extends StatefulWidget {
  const ProfileViewing({super.key});

  @override
  State<ProfileViewing> createState() => _ProfileViewingState();
}

class _ProfileViewingState extends State<ProfileViewing> {
  late List<User> _userlist;
  final _userService = UserService();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(),
    );
  }
}
