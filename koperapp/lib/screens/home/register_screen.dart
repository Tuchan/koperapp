import 'package:flutter/material.dart';
import 'package:koperapp/backend/auth.dart';
import 'package:koperapp/screens/home/home_screen.dart';
import 'package:koperapp/screens/home/error_message.dart';
import 'package:koperapp/screens/home/purgatory.dart';

// bool passwordVisible = false;

// @override
// void initState() {
//   passwordVisible = false;
// }

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _klasa = "Klasa";
  late String _email, _pass, _login;
  final _formKey = GlobalKey<FormState>();
  FAuth auth = FAuth();
  // void showpw() {
  //   setState(() {
  //     passwordVisible = !passwordVisible;
  //   });
  // }

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
          child: Form(
            key: _formKey,
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
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: TextFormField(
                          onChanged: (value){
                            setState(() {
                              _login = value.trim();
                            });
                          },
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Login",
                              hintText: "Nick do użycia w aplikacji"),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Nie chcesz się nazywać? :/';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Flexible(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 5,
                            height: MediaQuery.of(context).size.height / 15,
                            child: DropdownButtonFormField<String>(
                              hint: Text(_klasa),
                              items: <String>[
                                '1A',
                                '1B',
                                '1C',
                                '1D',
                                '2AC',
                                '2B',
                                '2D',
                                '2E',
                                '3AP',
                                '3BP',
                                '3CP',
                                '3DP',
                                '3BG',
                                '3CG',
                                '3DG'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                this._klasa = value!;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    onChanged: (value){
                      this._pass = value.trim();
                    },
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Hasło",
                        hintText: "ma być bezpieczne pls" // change later
                        // suffixIcon: IconButton(
                        //     onPressed: showpw,
                        //     icon: ImageIcon(
                        //         AssetImage('assets/icons/splash.png')))
                        ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Hasła nie podasz?...';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Potwierdź hasło",
                        hintText:
                            "sorry no... mogł*ś źle wpisać haha" // change later
                        // suffixIcon: IconButton(
                        //     onPressed: showpw,
                        //     icon: ImageIcon(
                        //         AssetImage('assets/icons/splash.png')))
                        ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'To akurat musisz potwierdzić... dla twojego dobra -_-';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    onChanged: (value){
                      this._email = value.trim();
                    },
                    obscureText: false,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "E-mail szkolny",
                        hintText: "...@lo1.elodz.edu.pl" // change later
                        // suffixIcon: IconButton(
                        //     onPressed: showpw,
                        //     icon: ImageIcon(
                        //         AssetImage('assets/icons/splash.png')))
                        ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'To jak my mamy wiedzieć czy jesteś z 1LO?...';
                      }
                      // if (value.matchAsPrefix("@lo1.elodz.edu.pl")) {
                      //   return 'To jak my mamy wiedzieć czy jesteś z 1LO?...';
                      // }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () async{
                      await this.auth.register(_login, _email, _pass).then((_) async{
                        await this.auth.verifyEmail();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Purgatory()));
                      }).catchError((err){
                        errorMessage(context, err);
                      });
                    },
                    child: Text("Zarejestruj się"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                        minimumSize: Size(
                            MediaQuery.of(context).size.width - 50,
                            MediaQuery.of(context).size.height / 15)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
