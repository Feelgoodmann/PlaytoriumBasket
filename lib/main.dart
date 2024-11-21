import 'package:flutter/material.dart';
import 'package:playtorium/scence/cart.dart';
import 'package:playtorium/scence/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Menu(),
      routes: {
        '/home':(context) => const Menu(),
        '/cart':(context) => const Cart(),
      },
    );
  }
}