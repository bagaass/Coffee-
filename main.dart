// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ukkkasir/page/login.dart';
import 'package:ukkkasir/provider/cart_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: LoginScreen(),
    );
  }
}
