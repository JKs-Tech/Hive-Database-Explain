import 'package:flutter/material.dart';
import 'package:new_todo/screens/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // init the hive
  await Hive.initFlutter();

// open Box
  var box = await Hive.openBox("mybox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(),
    );
  }
}
