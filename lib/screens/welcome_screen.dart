// import 'package:flutter/material.dart';
// import 'login_screen.dart';
// import 'registration_screen.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:new2/components/roundButton.dart';
//
// class WelcomeScreen extends StatefulWidget {
//
//   static const String id = 'welcome_screen' ;    // use to redirectnpage, use in main.dart
//
//   @override
//   _WelcomeScreenState createState() => _WelcomeScreenState();
// }
//
// class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
//
//   late AnimationController controller ;
//   late Animation animation ;
//   @override
//   void initState(){
//     super.initState() ;
//     controller = AnimationController(
//       duration: Duration(seconds: 2),
//       vsync: this,);
//
//     animation = ColorTween(begin: Colors.grey, end: Colors.white).animate(controller) ;
//
//     controller.forward() ;
//     controller.addListener(() {
//       setState(() { });
//       print(controller.value);
//     });
//   }
//   @override
//   void dispose(){
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: animation.value,
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Row(
//               children: <Widget>[
//                 Hero(tag: 'logo',
//                   child: Container(
//                     child: Image.asset('images/logo.png'),
//                     height: 60,
//                   ),
//                 ),
//                 AnimatedTextKit(animatedTexts: [
//                   TypewriterAnimatedText (
//                     'Flash Chat',
//                     textStyle: TextStyle(
//                       color: Colors.black54,
//                       fontSize: 45.0,
//                       fontWeight: FontWeight.w900,
//                     ),
//                   ),
//                 ],
//                 ),
//
//               ],
//             ),
//             SizedBox(
//               height: 48.0,
//             ),
//             RoundButton(colour: Colors.lightBlueAccent,
//               title: 'Register',
//               onPressed: () {
//                 Navigator.pushNamed(context, RegistrationScreen.id);
//               },),
//
//             RoundButton(colour: Colors.blue,
//               title: 'Login',
//               onPressed: (){
//                 Navigator.pushNamed(context, LoginScreen.id) ;
//               },),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
// // Function of Button
//

// import 'package:flutter/material.dart';
// import 'login_screen.dart';
// import 'registration_screen.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
//
// class WelcomeScreen extends StatefulWidget {
//   static const String id = 'welcome_screen'; // Use to redirect to page, use in main.dart
//
//   @override
//   _WelcomeScreenState createState() => _WelcomeScreenState();
// }
//
// class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation<Color?> colorAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//       duration: Duration(seconds: 3),
//       vsync: this,
//     );
//
//     colorAnimation = ColorTween(begin: Colors.blueAccent, end: Colors.white).animate(controller);
//
//     controller.forward();
//     controller.addListener(() {
//       setState(() {});
//     });
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Use a gradient or background image instead of a single color
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [colorAnimation.value!, Colors.white],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Row(
//                 children: <Widget>[
//                   Hero(
//                     tag: 'logo',
//                     child: Container(
//                       child: Image.asset('images/logo.png'),
//                       height: 60,
//                     ),
//                   ),
//                   SizedBox(width: 10), // Added spacing between the logo and text
//                   Expanded(
//                     child: DefaultTextStyle(
//                       style: TextStyle(
//                         color: Colors.black54,
//                         fontSize: 45.0,
//                         fontWeight: FontWeight.w900,
//                       ),
//                       child: AnimatedTextKit(
//                         animatedTexts: [
//                           TypewriterAnimatedText('Flash Chat'),
//                         ],
//                         isRepeatingAnimation: false,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 48.0),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.lightBlueAccent, // Changed from 'primary' to 'backgroundColor'
//                   padding: EdgeInsets.symmetric(vertical: 16.0),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                 ),
//                 child: Text(
//                   'Register',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//                 onPressed: () {
//                   Navigator.pushNamed(context, RegistrationScreen.id);
//                 },
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Changed from 'primary' to 'backgroundColor'
//                   padding: EdgeInsets.symmetric(vertical: 16.0),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                 ),
//                 child: Text(
//                   'Login',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//                 onPressed: () {
//                   Navigator.pushNamed(context, LoginScreen.id);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// new

import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen'; // Use to redirect to page, use in main.dart

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    colorAnimation = ColorTween(begin: Colors.black, end: Colors.grey[900]).animate(controller);

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background image
          // Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('images/dark_background.jpg'), // Replace with your dark background image
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorAnimation.value!, Colors.black.withOpacity(0.8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Decorative shapes and patterns
          Positioned(
            top: -150,
            left: -150,
            child: Opacity(
              opacity: 0.2,
              child: Container(
                width: 400,
                height: 400,
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
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: 0,
            child: Opacity(
              opacity: 0.2,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purple.withOpacity(0.1),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 0,
            child: Opacity(
              opacity: 0.2,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.teal.withOpacity(0.1),
                ),
              ),
            ),
          ),
          // Main content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Container(
                        child: Image.asset('images/logo.png'),
                        height: 60,
                      ),
                    ),
                    SizedBox(width: 10), // Added spacing between the logo and text
                    Expanded(
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.white, // Text color adjusted for dark theme
                          fontSize: 45.0,
                          fontWeight: FontWeight.w900,
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText('Flash Chat'),
                          ],
                          isRepeatingAnimation: false,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 48.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent, // Bright color for dark theme
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 20.0, color: Colors.black87), // Text color adjusted for contrast
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.tealAccent, // Bright color for dark theme
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20.0, color: Colors.black87), // Text color adjusted for contrast
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




