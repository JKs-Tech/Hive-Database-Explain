import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonname;
  VoidCallback onPressed;
  MyButton({super.key, required this.buttonname, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(buttonname),
    );
  }
}
