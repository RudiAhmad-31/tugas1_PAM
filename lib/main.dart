import 'package:flutter/material.dart';
import 'menu/kalkulator.dart'; // langsung import kalkulator
//test bisa pull engga
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
      home: KalkulatorPage(), // langsung buka kalkulator
    );
  }
}
