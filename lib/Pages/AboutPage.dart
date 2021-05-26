import 'package:flutter/material.dart';
class AboutPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ElevatedButton(
              child: Text('Go to Contact screen'),
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => ContactPage()));
              }),
        ),
    );
  }
}