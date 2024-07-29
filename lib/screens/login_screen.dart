// import 'package:flutter/material.dart';
// import 'package:new2/components/roundButton.dart';
// import 'package:new2/constants.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:new2/screens/users_list.dart';
//
// class LoginScreen extends StatefulWidget {
//
//   static const String id = 'login_screen' ;    // use to redirectnpage, use in main.dart
//
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//
//   final _auth = FirebaseAuth.instance ;
//   late String email ;
//   late String password ;
//   bool showSpinner = false ;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ModalProgressHUD(
//         inAsyncCall: showSpinner,
//
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Flexible(
//                 child: Hero(tag: 'logo',
//                   child: Container(
//                     height: 200.0,
//                     child: Image.asset('images/logo.png'),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 48.0,
//               ),
//               TextField(
//                 keyboardType: TextInputType.emailAddress, // this is optional, it is customize keyboard
//                 textAlign: TextAlign.center,
//                 onChanged: (value) {
//                  email = value ;
//                 },
//                 decoration: KTextField.copyWith(hintText: 'Enter Email'),
//               ),
//               SizedBox(
//                 height: 8.0,
//               ),
//               TextField(
//                 textAlign: TextAlign.center,
//                 obscureText: true,
//                 onChanged: (value) {
//                  password = value ;
//                 },
//                 decoration: KTextField.copyWith(hintText: 'Enter Password'),
//               ),
//               SizedBox(
//                 height: 24.0,
//               ),
//
//               RoundButton (
//                   colour: Colors.lightBlueAccent,
//                   title: 'Login',
//                   onPressed: () async{
//                     setState(() {
//                       showSpinner = true ;
//                     });
//                     try {
//                       final user = await _auth.signInWithEmailAndPassword(
//                           email: email, password: password);
//                       if(user != null){
//                         Navigator.pushNamed(context, UserList.id) ;
//                         // Navigator.push(
//                         //     context,
//                         //     MaterialPageRoute(builder: (context) =>  HomeScreen()));
//
//                       }
//                       showSpinner = false ;
//                     }
//                     catch(e){
//                       print(e);
//                     }
//                   }
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// new

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:new2/components/roundButton.dart';
import 'package:new2/constants.dart';
import 'users_list.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen'; // Use to redirect to page, use in main.dart

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background with gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey[800]!, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Decorative shapes
          Positioned(
            top: -100,
            left: -100,
            child: Opacity(
              opacity: 0.2,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            right: -100,
            child: Opacity(
              opacity: 0.2,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
          ),
          // Main content with 3D card effect
          Center(
            child: ModalProgressHUD(
              inAsyncCall: showSpinner,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Material(
                  elevation: 10.0, // Adds shadow for 3D effect
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[850], // Card color
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Ensures the column fits the content
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Hero(
                          tag: 'logo',
                          child: Container(
                            height: 150.0,
                            child: Image.asset('images/logo.png'),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextField(
                          keyboardType: TextInputType.emailAddress, // Customize keyboard for email
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white), // Text color
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Email',
                            hintStyle: TextStyle(color: Colors.grey[400]), // Hint text color
                            filled: true,
                            fillColor: Colors.grey[700], // Field background color
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          obscureText: true,
                          style: TextStyle(color: Colors.white), // Text color
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                            hintStyle: TextStyle(color: Colors.grey[400]), // Hint text color
                            filled: true,
                            fillColor: Colors.grey[700], // Field background color
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        RoundButton(
                          colour: Colors.deepOrangeAccent, // Button color for dark theme
                          title: 'Login',
                          onPressed: () async {
                            setState(() {
                              showSpinner = true;
                            });
                            try {
                              final user = await _auth.signInWithEmailAndPassword(
                                email: email,
                                password: password,
                              );
                              if (user != null) {
                                Navigator.pushNamed(context, UserList.id);
                              }
                            } catch (e) {
                              print(e);
                            } finally {
                              setState(() {
                                showSpinner = false;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
