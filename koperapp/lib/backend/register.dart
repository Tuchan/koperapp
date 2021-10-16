import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final fba = FirebaseAuth.instance;

void register(String login, String cls, String email, String pass) async{
  final db = FirebaseFirestore.instance.collection("Users");
  await fba.createUserWithEmailAndPassword(
      email: email,
      password: pass
  );
  fba.currentUser!.sendEmailVerification();
  db.add({
    "id": fba.currentUser!.uid,
    "login": login,
    "cls": cls,
    "email": email,
    "pass": pass
  });
}

void login(String email, String pass) async{
  await fba.signInWithEmailAndPassword(
      email: email,
      password: pass
  );
}

void logout() async{
  await fba.signOut();
}