import 'package:flutter/material.dart';
import 'package:koperapp/screens/home/error_message.dart';
import 'package:koperapp/screens/home/register_screen.dart';
import 'package:koperapp/screens/home/home_screen.dart';
import 'package:koperapp/screens/home/purgatory.dart';
import 'package:koperapp/backend/auth.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email, _pass;
  FAuth auth = FAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.switch_account),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Login"),
                  onChanged: (value){
                    setState(() {
                      _email = value.trim();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Hasło"),
                  onChanged: (value){
                    setState(() {
                      _pass = value.trim();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () async{
                    await auth.logIn(_email, _pass).then((_) async{
                      if (auth.verifiedEmail) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                      }else{
                        await auth.verifyEmail();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Purgatory()));
                      }
                    }).catchError((err){
                      errorMessage(context, err);
                    });
                  },
                  child: Text("Zaloguj się"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
                      minimumSize: Size(MediaQuery.of(context).size.width - 50,
                          MediaQuery.of(context).size.height / 15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RegisterScreen()));
                  },
                  child: Text(
                    "Zarejestruj się",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blueGrey, width: 3.0),
                      minimumSize: Size(MediaQuery.of(context).size.width - 50,
                          MediaQuery.of(context).size.height / 15)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
