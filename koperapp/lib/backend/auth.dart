import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

// authenticator class

class FAuth{
  final auth = FirebaseAuth.instance;
  late User? user = auth.currentUser;

  bool get loggedIn{
    return this.user != null;
  }

  bool get verifiedEmail{
    if (this.loggedIn) return this.user!.emailVerified;
    return false;
  }

  Future<void> register(String name, String email, String pass) async{
    this.user = (await this.auth.createUserWithEmailAndPassword(email: email, password: pass)).user;
    await this.user!.updateDisplayName(name);
    await this.reload();
  }

  Future<void> logIn(String email, String pass) async{
    this.user = (await this.auth.signInWithEmailAndPassword(email: email, password: pass)).user;
  }

  Future<void> logOut() async{
    await this.auth.signOut();
    this.user = null;
  }

  Future<void> verifyEmail() async{
    await this.user!.sendEmailVerification();
  }

  Future<void> reload() async{
    await this.user!.reload();
    this.user = auth.currentUser;
  }
}
