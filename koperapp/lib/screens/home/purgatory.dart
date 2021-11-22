import 'package:flutter/material.dart';
import 'package:koperapp/backend/auth.dart';
import 'package:koperapp/screens/home/error_message.dart';
import 'package:koperapp/screens/home/home_screen.dart';

// https://www.youtube.com/watch?v=Gy3BOmvLf2w

class Purgatory extends StatefulWidget {
  const Purgatory({Key? key}) : super(key: key);

  @override
  _PurgatoryState createState() => _PurgatoryState();
}

class _PurgatoryState extends State<Purgatory> {
  FAuth auth = FAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("twój stary generator pary")
      ),
      body: Center(
        child: Column(children: [
          Text("email weryfikacyjny wysłany do ${auth.user?.email}"),
          ElevatedButton(
              onPressed: () async{
                await auth.verifyEmail().catchError((err){
                  errorMessage(context, err);
                });
              }, child: Text("wyślij ponownie")),
          ElevatedButton(onPressed: () async{
            await auth.reload().catchError((err){
              errorMessage(context, err);
              return null;
            });
            if (auth.verifiedEmail) Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeScreen()));
          }, child: Text("odśwież"))
        ],),
      )
    );
  }
}

