import 'package:flutter/material.dart';
import 'menu/kalkulator.dart'; // langsung import kalkulator
import 'menu/login.dart'; // ke login ??
import 'menu/data_kelompok.dart'; //ke data kelompok ??

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing Kalkulator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(), // langsung buka kalkulator
    );
  }
}
