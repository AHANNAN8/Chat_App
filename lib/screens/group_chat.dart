// // import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:new2/constants.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:new2/screens/welcome_screen.dart';
//
// final _fireStore = FirebaseFirestore.instance;
//  User? logInUser ;
//
// class GroupChat extends StatefulWidget {
//
//   static const String id = 'group_chat' ;    // use to redirectnpage, use in main.dart
//
//
//   @override
//   _GroupChatState createState() => _GroupChatState();
// }
//
// class _GroupChatState extends State<GroupChat> {
//   final MessageTextController = TextEditingController();
//   final _auth = FirebaseAuth.instance ;
//
//   late String messageText ;
//
//
// @override
// void initState(){
//   super.initState();
//   getCurrentUser();
// }
//   void getCurrentUser() async {
//     try {
//       final user = await _auth.currentUser;
//       if(user != null){
//         logInUser = user;
//         // print(logInUser!.email);
//       }
//     }
//     catch(e){
//       print(e);
//     }
//   }
//
//   // void getmessage() async{
//   // final message = await _fireStore.collection('messages').get();
//   // for(var userMsg in message.docs){
//   //   print(userMsg.data());
//   // }  }
//
//   // void messageStream() async{
//   //      await for(var snapshot in _fireStore.collection('messages').snapshots()){
//   //        for(var userMsg in snapshot.docs){
//   //          print(userMsg.data());
//   //        }
//   //      }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   leading: null,
//       //   actions: <Widget>[
//       //     IconButton(
//       //         icon: Icon(Icons.close),
//       //         onPressed: () {
//       //           // messageStream();
//       //            _auth.signOut();
//       //            Navigator.popAndPushNamed(context, WelcomeScreen.id);
//       //            // Navigator.pushNamed(context, WelcomeScreen.id);
//       //         }),
//       //   ],
//       //   title: Text('⚡️Chat'),
//       //   backgroundColor: Colors.lightBlueAccent,
//       // ),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//
//             MessageStream(),
//
//             Container(
//               decoration: kMessageContainerDecoration,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Expanded(
//                     child: TextField(
//                       controller: MessageTextController,
//                       onChanged: (value) {
//                       messageText = value;
//                       },
//                       decoration: kMessageTextFieldDecoration,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       MessageTextController.clear();
//                     var timestamp = Timestamp.now();
//                     _fireStore.collection('messages').add({
//                       'text': messageText,
//                       'sender': logInUser!.email,
//                       'timestamp': timestamp,
//                     });
//                     },
//                     child: Text(
//                       'Send',
//                       style: kSendButtonTextStyle,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // stream builder
// class MessageStream extends StatelessWidget {
//   const MessageStream({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _fireStore.collection('messages').orderBy('timestamp').snapshots(),
//       builder:(context,snapshot){
//         if (! snapshot.hasData) {
//           return Center(
//             child: CircularProgressIndicator(
//               backgroundColor: Colors.orangeAccent,
//             ),
//           );
//         }
//         final messages = snapshot.data!.docs.reversed;
//         List<MessageBubble> MessageBubbles = [] ;
//         for(var message in messages){
//           final messageText = message['text'];
//           final messageSender = message['sender'];
//           final currentUser = logInUser?.email ;
//
//           final messageBubble = MessageBubble(
//               sender:messageSender,
//               text:messageText,
//
//               isMe: currentUser == messageSender);
//               MessageBubbles.add(messageBubble);
//         }
//         return Expanded(
//           child: ListView(
//             reverse: true,
//             padding: EdgeInsets.symmetric(horizontal:10.0,vertical:20.0),
//             children: MessageBubbles ,
//           ),
//         );
//
//         // return Container();
//         // throw();
//       },
//     );
//   }
// }
//
// //  message display design
// class MessageBubble extends StatelessWidget {
//    MessageBubble({required this.sender, required this.text, required this.isMe});
//
//   final String text;
//   final String sender;
//
//   final bool isMe ;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding( padding: EdgeInsets.all(10),
//       child: Column(
//         crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//         children: [
//           Text(sender,
//           style: TextStyle(fontSize: 12,
//           color: Colors.black54),
//           ),
//          Material(
//           elevation: 5,
//           borderRadius: isMe ? BorderRadius.only(
//             topLeft: Radius.circular(30),
//             bottomLeft: Radius.circular(30),
//             bottomRight: Radius.circular(30)) :
//               BorderRadius.only(   //this is condition border
//                   topRight: Radius.circular(30),
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30)
//           ),
//           color: isMe ? Colors.lightBlueAccent : Colors.white70 ,
//           child: Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//             child: Text(text,
//               style: TextStyle(
//                 fontSize: 15.0,
//                 color: isMe ? Colors.white : Colors.black ,
//               ),
//             ),
//           ),
//         ),
//       ],
//       ),
//     );
//   }
// }
//
// new

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _fireStore = FirebaseFirestore.instance;
User? logInUser;

class GroupChat extends StatefulWidget {
  static const String id = 'group_chat'; // use to redirect page, use in main.dart

  @override
  _GroupChatState createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  final MessageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  late String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        setState(() {
          logInUser = user;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      // appBar: AppBar(
      //   backgroundColor: Colors.grey[900],
      //   title: Text('Group Chat'),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.logout),
      //       onPressed: () async {
      //         await FirebaseAuth.instance.signOut();
      //         Navigator.popUntil(context, (route) => route.isFirst);
      //       },
      //     ),
      //   ],
      // ),
      body: Container(

            // colors: [Colors.black87, Colors.grey[850]!],


        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: MessageStream(),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: MessageTextController,
                          onChanged: (value) {
                            messageText = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your message...',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        MessageTextController.clear();
                        var timestamp = Timestamp.now();
                        _fireStore.collection('messages').add({
                          'text': messageText,
                          'sender': logInUser!.email,
                          'timestamp': timestamp,
                        });
                      },
                      child: Text(
                        'Send',
                        style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _fireStore.collection('messages').orderBy('timestamp').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
            ),
          );
        }
        final messages = snapshot.data!.docs.reversed;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message['text'];
          final messageSender = message['sender'];
          final currentUser = logInUser?.email;

          final messageBubble = MessageBubble(
            sender: messageSender,
            text: messageText,
            isMe: currentUser == messageSender,
          );
          messageBubbles.add(messageBubble);
        }
        return ListView(
          reverse: true,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: messageBubbles,
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final String sender;
  final bool isMe;

  MessageBubble({required this.sender, required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(fontSize: 12, color: Colors.grey[400]),
          ),
          Material(
            elevation: 5,
            borderRadius: isMe
                ? BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )
                : BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: isMe ? Colors.lightBlueAccent : Colors.grey[700],
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15.0,
                  color: isMe ? Colors.white : Colors.white70,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

