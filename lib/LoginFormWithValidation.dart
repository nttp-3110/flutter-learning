import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Widgets/button_widget.dart';
import 'Pages/HomePage.dart';
import 'Widgets/color_utils.dart';
class LoginFormValidation extends StatefulWidget {
  @override
  _LoginFormValidationState createState() => _LoginFormValidationState();
}

class _LoginFormValidationState extends State<LoginFormValidation> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 6) {
      return "Password should be atleast 6 characters";
    } else if (value.length > 15) {
      return "Password should not be greater than 15 characters";
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          autovalidate: false, //check for validation while typing
          key: formkey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 64.0),
                child: Center(
                  child: Container(
                      width: 300,
                      height: 160,
                      child: SvgPicture.asset('asset/images/tabula_logo_full_bw.svg', color: Colors.blue)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 8.0, left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Sign In', style: TextStyle(color: Colors.black, fontSize: 20),),
                )
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 8.0, left: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Email Address', style: TextStyle(fontWeight: FontWeight.bold),),
                  )
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Your Email Address'),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "This information is required."),
                      EmailValidator(errorText: "Enter valid email id"),
                    ])),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: FlatButton(
                  onPressed: () {
                    // if (formkey.currentState.validate()) {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (_) => HomePage()));
                    //   print("Validated");
                    // } else {
                    //   print("Not Validated");
                    // }
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildSnackbarButton(BuildContext context) {
  //   return raisedButton(
  //       textColor: Colors.white,
  //       minWidth: 300,
  //       text: "Show Snackbar",
  //       height: 50.0,
  //       borderRadius: 5,
  //       color: primaryColor,
  //       borderSideColor: Colors.white,
  //       splashColor: Colors.blue[200],
  //       style: TextStyle(
  //         color: primaryColor,
  //         fontSize: 14.0,
  //         fontWeight: FontWeight.w500,
  //         fontStyle: FontStyle.normal,
  //         letterSpacing: 1.2,
  //       ),
  //       onClick: () {});
  // }
}

// // Home Screen
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Kindacode.com',
//           style: Theme.of(context).appBarTheme.titleTextStyle,
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.home),
//             onPressed: () {},
//           )
//         ],
//       ),
//       body: Center(
//         child: ElevatedButton(
//             child: Text(
//               'Go To About Screen',
//             ),
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => AboutPage()));
//             }),
//       ),
//     );
//   }
// }

// About Screen
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Override the global settings
        title: Text(
          'About Screen',
          style: Theme.of(context)
              .appBarTheme
              .titleTextStyle!
              .copyWith(color: Colors.white),
        ),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.info), onPressed: () {})],
      ),
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
