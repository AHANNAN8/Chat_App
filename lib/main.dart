import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart' ;
import 'package:flutter/material.dart';
import 'package:new2/screens/welcome_screen.dart';
import 'package:new2/screens/login_screen.dart';
import 'package:new2/screens/registration_screen.dart';
import 'package:new2/screens/group_chat.dart';
import 'package:new2/screens/users_list.dart';
import 'package:new2/screens/chat_screen.dart';

// Future<void> main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp() ;
//   runApp(FlashChat());
// }

void main() async{

  WidgetsFlutterBinding.ensureInitialized() ;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(FlashChat() ) ;
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // initialRoute: 'welcome_screen' ,  // method 1 this is not file name itis custom name
      initialRoute: WelcomeScreen.id ,
      routes: {
        // 'welcome_screen' : (context)=> WelcomeScreen() ,// method 1 welcome_screen is not file name itis custom name
        WelcomeScreen.id : (context)=> WelcomeScreen() ,
        LoginScreen.id : (context)=> LoginScreen() ,
        RegistrationScreen.id : (context)=> RegistrationScreen() ,
        GroupChat.id : (context)=> GroupChat() ,
        UserList.id : (context)=> UserList(),
        // ChatScreen.id : (context)=>ChatScreen(),
      },

    );
  }
}