import 'package:flutter/material.dart';

class TextField1 extends StatelessWidget {
  final String textt;
  final TextEditingController controller;
  final String? errorText;

  const TextField1({
    super.key,
    required this.textt,
    required this.controller,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: textt,
        errorText: errorText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        icon: Icon(Icons.phone_in_talk_outlined),
      ),
      textInputAction: TextInputAction.next,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
    );
  }
}
