import 'package:flutter/material.dart';
import '../Theme/colors_demo.dart';
class ThemePage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<ThemePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ColorsDemo()
      ),
    );
  }
}