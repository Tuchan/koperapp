import 'package:flutter/material.dart';
import 'package:koperapp/screens/home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {},
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
                  onPressed: () {},
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
