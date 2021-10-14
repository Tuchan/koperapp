import 'package:flutter/material.dart';
import 'package:koperapp/screens/home/home_screen.dart';
import 'package:koperapp/screens/home/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Koper App',
      theme: ThemeData(primaryColor: Colors.blueGrey),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
