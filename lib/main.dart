import 'package:flutter/material.dart';
import 'package:flutter_stopwatch/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      color: Colors.blue,
      home: MyHomePage(),
    );
  }
}
