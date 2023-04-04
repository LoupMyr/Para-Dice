import 'package:flutter/material.dart';
import 'package:para_dice/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Para\'Dice',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Para\'Dice Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}
