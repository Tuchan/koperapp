import 'package:flutter/material.dart';

void errorMessage(BuildContext context, dynamic err){
  final snack = SnackBar(content: Text(err.toString()));
  ScaffoldMessenger.of(context).showSnackBar(snack);
}