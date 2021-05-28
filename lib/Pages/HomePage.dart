import 'package:flutter/material.dart';
import './AboutPage.dart';
import './ThemePage.dart';
import 'Todo/TodoPage.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  this.getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: this.selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text("Theme"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text("Todo"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
          ),

        ],
        onTap: (int index) {
          this.onTapHandler(index);
        },
      ),
    );
  }
  Widget getBody( )  {
    if(this.selectedIndex == 0) {
      return ThemePage();
    } else if(this.selectedIndex==1) {
      return TodoPage();
    } else {
      return AboutPage();
    }
  }
  void onTapHandler(int index)  {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
}
