import 'package:flutter/material.dart';
import 'package:up_sell_up/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'U Sell Up',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.grey[100],
        primaryColorLight: Colors.grey[100],
        primaryColorDark: Colors.grey[100]
      ),
      home: const Home(),
    );
  }
}
