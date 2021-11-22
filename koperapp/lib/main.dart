import 'package:flutter/material.dart';
import 'package:koperapp/screens/home/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  // init firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
