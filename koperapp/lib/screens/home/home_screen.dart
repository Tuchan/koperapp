import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('lmao'),
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset("assets\icons\more_lines.svg"),
            onPressed: null,
          )),
    );
  }
}
