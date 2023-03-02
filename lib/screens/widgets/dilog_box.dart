import 'package:flutter/material.dart';
import 'package:new_todo/screens/widgets/my_button.dart';

class DilogBoxw extends StatelessWidget {
  final controller;
  VoidCallback onSaved;
  DilogBoxw({super.key, required this.controller, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 252, 239, 98),
      content: Container(
        width: 120,
        height: 120,
        child: Column(children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Enter here",
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 7, 8, 10),
                  ),
                  borderRadius: BorderRadius.circular(10)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 7, 8, 10),
                  ),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(
                buttonname: "Save",
                onPressed: onSaved,
              ),
              SizedBox(
                width: 6,
              ),
              MyButton(
                buttonname: "Cancel",
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          )
        ]),
      ),
    );
  }
}
