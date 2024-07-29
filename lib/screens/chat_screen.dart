// import 'package:flutter/material.dart';
// import 'package:new2/constants.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:new2/screens/welcome_screen.dart';
// import 'package:new2/models/UserModel.dart';
// import 'package:new2/models/ChatRoomModel.dart';
//
// class ChatScreen extends StatefulWidget {
//   static const String id = 'chat_screen' ;// use to redirectnpage, use in main.dart
//
//   ChatScreen({required this.targetUser, required this.chatroom, required this.firebaseUser, required this.userModel}) ;
//
//
//
//    final String targetUser ;
//    final ChatRoomModel chatroom ;
//    final UserModel userModel ;
//    final User firebaseUser ;
//
//
//
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: null,
//         actions: <Widget>[
//           IconButton(
//               icon: Icon(Icons.close),
//               onPressed: () {
//                 // messageStream();
//                 // _auth.signOut();
//                 Navigator.popAndPushNamed(context, WelcomeScreen.id);
//                 // Navigator.pushNamed(context, WelcomeScreen.id);
//               }),
//         ],
//         title: Text('⚡️Chat'),
//         backgroundColor: Colors.lightBlueAccent,
//       ),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
// Container(
//
// ),
//             // MessageStream(),
//
//             Container(
//               decoration: kMessageContainerDecoration,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Expanded(
//                     child: TextField(
//                       // controller: MessageTextController,
//                       onChanged: (value) {
//                         // messageText = value;
//                       },
//                       decoration: kMessageTextFieldDecoration,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       // MessageTextController.clear();
//                       // var timestamp = Timestamp.now();
//                       // _fireStore.collection('messages').add({
//                       //   'text': messageText,
//                       //   'sender': logInUser!.email,
//                       //   'timestamp': timestamp,
//                       // });
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
// // class MessageStream extends StatelessWidget {
// //   const MessageStream({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return StreamBuilder<QuerySnapshot>(
// //       stream: _fireStore.collection('messages').orderBy('timestamp').snapshots(),
// //       builder:(context,snapshot){
// //         if (! snapshot.hasData) {
// //           return Center(
// //             child: CircularProgressIndicator(
// //               backgroundColor: Colors.orangeAccent,
// //             ),
// //           );
// //         }
// //         final messages = snapshot.data!.docs.reversed;
// //         List<MessageBubble> MessageBubbles = [] ;
// //         for(var message in messages){
// //           final messageText = message['text'];
// //           final messageSender = message['sender'];
// //           final currentUser = logInUser?.email ;
// //
// //           final messageBubble = MessageBubble(
// //               sender:messageSender,
// //               text:messageText,
// //
// //               isMe: currentUser == messageSender);
// //           MessageBubbles.add(messageBubble);
// //         }
// //         return Expanded(
// //           child: ListView(
// //             reverse: true,
// //             padding: EdgeInsets.symmetric(horizontal:10.0,vertical:20.0),
// //             children: MessageBubbles ,
// //           ),
// //         );
// //
// //         // return Container();
// //         // throw();
// //       },
// //     );
// //   }
// // }
//
// //  message display design
// class MessageBubble extends StatelessWidget {
//   MessageBubble({required this.sender, required this.text, required this.isMe});
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
//             style: TextStyle(fontSize: 12,
//                 color: Colors.black54),
//           ),
//           Material(
//             elevation: 5,
//             borderRadius: isMe ? BorderRadius.only(
//                 topLeft: Radius.circular(30),
//                 bottomLeft: Radius.circular(30),
//                 bottomRight: Radius.circular(30)) :
//             BorderRadius.only(   //this is condition border
//                 topRight: Radius.circular(30),
//                 bottomLeft: Radius.circular(30),
//                 bottomRight: Radius.circular(30)
//             ),
//             color: isMe ? Colors.lightBlueAccent : Colors.white70 ,
//             child: Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//               child: Text(text,
//                 style: TextStyle(
//                   fontSize: 15.0,
//                   color: isMe ? Colors.white : Colors.black ,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// second code

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:new2/models/UserModel.dart'; // Replace with your actual UserModel import
// import 'package:new2/models/ChatRoomModel.dart'; // Replace with your actual ChatRoomModel import
// import 'package:new2/screens/welcome_screen.dart'; // Replace with your actual WelcomeScreen import
// import 'package:new2/constants.dart'; // Replace with your actual constants file import
//
// class ChatScreen extends StatefulWidget {
//   static const String id = 'chat_screen';
//
//   final String? targetUser;
//   final ChatRoomModel? chatroom;
//   final UserModel? userModel;
//   final User? firebaseUser;
//
//   ChatScreen({
//       this.targetUser,
//      this.chatroom,
//      this.firebaseUser,
//      this.userModel,
//     required String targetUserEmail,
//   });
//
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _messageController = TextEditingController();
//
//   void sendMessage() {
//     String messageText = _messageController.text.trim();
//     if (messageText.isNotEmpty) {
//       var timestamp = Timestamp.now();
//       FirebaseFirestore.instance.collection('messages').add({
//         'text': messageText,
//         'sender': widget.firebaseUser?.email,
//         'timestamp': timestamp,
//       });
//       _messageController.clear();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: null,
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.close),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ],
//         title: Text('⚡️Chat with ${widget.targetUser}'),
//         backgroundColor: Colors.lightBlueAccent,
//       ),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             MessageStream(),
//             Container(
//               decoration: kMessageContainerDecoration,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Expanded(
//                     child: TextField(
//                       controller: _messageController,
//                       decoration: kMessageTextFieldDecoration,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: sendMessage,
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
// class MessageStream extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('messages')
//           .orderBy('timestamp', descending: true)
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Center(
//             child: CircularProgressIndicator(
//               backgroundColor: Colors.orangeAccent,
//             ),
//           );
//         }
//
//         final messages = snapshot.data!.docs;
//
//         List<MessageBubble> messageBubbles = [];
//         for (var message in messages) {
//           final messageText = message['text'];
//           final messageSender = message['sender'];
//           final currentUser = FirebaseAuth.instance.currentUser!.email;
//
//           final messageBubble = MessageBubble(
//             sender: messageSender,
//             text: messageText,
//             isMe: currentUser == messageSender,
//           );
//           messageBubbles.add(messageBubble);
//         }
//
//         return Expanded(
//           child: ListView(
//             reverse: true,
//             padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
//             children: messageBubbles,
//           ),
//         );
//       },
//     );
//   }
// }
//
// class MessageBubble extends StatelessWidget {
//   MessageBubble({required this.sender, required this.text, required this.isMe});
//
//   final String text;
//   final String sender;
//   final bool isMe;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(10.0),
//       child: Column(
//         crossAxisAlignment:
//         isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//         children: [
//           Text(
//             sender,
//             style: TextStyle(fontSize: 12.0, color: Colors.black54),
//           ),
//           Material(
//             elevation: 5.0,
//             borderRadius: BorderRadius.only(
//               topLeft: isMe ? Radius.circular(30.0) : Radius.circular(0.0),
//               topRight: isMe ? Radius.circular(0.0) : Radius.circular(30.0),
//               bottomLeft: Radius.circular(30.0),
//               bottomRight: Radius.circular(30.0),
//             ),
//             color: isMe ? Colors.lightBlueAccent : Colors.white70,
//             child: Padding(
//               padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//               child: Text(
//                 text,
//                 style: TextStyle(
//                   fontSize: 15.0,
//                   color: isMe ? Colors.white : Colors.black,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//  third code

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:new2/models/UserModel.dart'; // Replace with your actual UserModel import
// import 'package:new2/models/ChatRoomModel.dart';
//
//
// class ChatScreen extends StatefulWidget {
//   static const String id = 'chat_screen';
//
//   final userModel currentUser; // Current user
//   final userModel targetUser; // User with whom the current user is chatting
//
//   ChatScreen({required this.currentUser, required this.targetUser});
//
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _messageController = TextEditingController();
//
//   void sendMessage() {
//     String messageText = _messageController.text.trim();
//     if (messageText.isNotEmpty) {
//       var timestamp = Timestamp.now();
//       String roomId = _generateChatRoomId(widget.currentUser.userId!, widget.targetUser.userId!);
//
//       // Save message in Firestore
//       FirebaseFirestore.instance.collection('chatrooms').doc(roomId).collection('messages').add({
//         'senderId': widget.currentUser.userId,
//         'text': messageText,
//         'timestamp': timestamp,
//         'roomid':roomId,
//         'participants': {
//           widget.currentUser.userId : true,
//           widget.targetUser.userId : true,
//         },
//       });
//       // widget.roomId.lastmessage = messageText ;
//
//       _messageController.clear();
//     }
//   }
//
//   String _generateChatRoomId(String userId1, String userId2) {
//     // Generate a unique chat room ID based on user IDs
//     List<String> userIds = [userId1, userId2];
//     userIds.sort(); // Sort user IDs to ensure consistency
//     return '${userIds[0]}_${userIds[1]}'; // Example: 'user1_user2'
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat with ${widget.targetUser.email}'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: MessageStream(currentUser: widget.currentUser, targetUser: widget.targetUser),
//           ),
//           Container(
//             padding: EdgeInsets.all(8.0),
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     decoration: InputDecoration(
//                       hintText: 'Enter your message...',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: sendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class MessageStream extends StatelessWidget {
//   final userModel currentUser;
//   final userModel targetUser;
//
//   MessageStream({required this.currentUser, required this.targetUser});
//
//   @override
//   Widget build(BuildContext context) {
//     String roomId = _generateChatRoomId(currentUser.userId!, targetUser.userId!);
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('chatrooms').doc(roomId).collection('messages').orderBy('timestamp').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         final messages = snapshot.data!.docs.reversed;
//
//         List<MessageBubble> messageBubbles = [];
//         for (var message in messages) {
//           final messageText = message['text'];
//           final messageSenderId = message['senderId'];
//           final isMe = messageSenderId == currentUser.userId;
//
//           final messageBubble = MessageBubble(
//             text: messageText,
//             isMe: isMe,
//           );
//           messageBubbles.add(messageBubble);
//         }
//
//         return ListView(
//           reverse: true,
//           padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
//           children: messageBubbles,
//         );
//       },
//     );
//   }
//
//   String _generateChatRoomId(String userId1, String userId2) {
//     List<String> userIds = [userId1, userId2];
//     userIds.sort();
//     return '${userIds[0]}_${userIds[1]}';
//   }
// }
//
// class MessageBubble extends StatelessWidget {
//   final String text;
//   final bool isMe;
//
//   MessageBubble({required this.text, required this.isMe});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 10.0),
//       child: Row(
//         mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//               color: isMe ? Colors.blueAccent : Colors.grey[300],
//               borderRadius: isMe
//                   ? BorderRadius.only(
//                 topLeft: Radius.circular(15.0),
//                 bottomLeft: Radius.circular(15.0),
//                 topRight: Radius.circular(15.0),
//               )
//                   : BorderRadius.only(
//                 topLeft: Radius.circular(15.0),
//                 bottomRight: Radius.circular(15.0),
//                 topRight: Radius.circular(15.0),
//               ),
//             ),
//             padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
//             constraints: BoxConstraints(
//               maxWidth: MediaQuery.of(context).size.width * 0.75,
//             ),
//             child: Text(
//               text,
//               style: TextStyle(
//                 color: isMe ? Colors.white : Colors.black,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// dummy code

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:new2/models/UserModel.dart'; // Replace with your actual UserModel import
// import 'package:new2/models/ChatRoomModel.dart';
//
//
// class ChatScreen extends StatefulWidget {
//   static const String id = 'chat_screen';
//
//   final userModel currentUser; // Current user
//   final userModel targetUser; // User with whom the current user is chatting
//
//   ChatScreen({required this.currentUser, required this.targetUser});
//
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _messageController = TextEditingController();
//
//   void sendMessage() {
//     String messageText = _messageController.text.trim();
//     if (messageText.isNotEmpty) {
//       var timestamp = Timestamp.now();
//       String roomId = _generateChatRoomId(widget.currentUser.userId!, widget.targetUser.userId!);
//
//       // Save message in Firestore
//       FirebaseFirestore.instance.collection('chatrooms').doc(roomId).collection('messages').add({
//         'sender': widget.currentUser.email,
//         'receiver': widget.targetUser.email,
//         'text': messageText,
//         'timestamp': timestamp,
//         'roomid':roomId,
//         'participants': {
//           widget.currentUser.userId : true,
//           widget.targetUser.userId : true,
//         },
//       });
//       // widget.roomId.lastmessage = messageText ;
//
//       _messageController.clear();
//     }
//   }
//
//   String _generateChatRoomId(String userId1, String userId2) {
//     // Generate a unique chat room ID based on user IDs
//     List<String> userIds = [userId1, userId2];
//     userIds.sort(); // Sort user IDs to ensure consistency
//     return '${userIds[0]}_${userIds[1]}'; // Example: 'user1_user2'
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat with ${widget.targetUser.email}'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: MessageStream(currentUser: widget.currentUser, targetUser: widget.targetUser),
//           ),
//           Container(
//             padding: EdgeInsets.all(8.0),
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     decoration: InputDecoration(
//                       hintText: 'Enter your message...',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: sendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class MessageStream extends StatelessWidget {
//   final userModel currentUser;
//   final userModel targetUser;
//
//   MessageStream({required this.currentUser, required this.targetUser});
//
//   @override
//   Widget build(BuildContext context) {
//     String roomId = _generateChatRoomId(currentUser.userId!, targetUser.userId!);
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('chatrooms').doc(roomId).collection('messages').orderBy('timestamp').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         final messages = snapshot.data!.docs.reversed;
//
//         List<MessageBubble> messageBubbles = [];
//         for (var message in messages) {
//           final messageText = message['text'];
//           final messageSenderId = message['sender'];
//           final isMe = messageSenderId == currentUser.email;
//
//           final messageBubble = MessageBubble(
//             text: messageText,
//             isMe: isMe,
//           );
//           messageBubbles.add(messageBubble);
//         }
//
//         return ListView(
//           reverse: true,
//           padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
//           children: messageBubbles,
//         );
//       },
//     );
//   }
//
//   String _generateChatRoomId(String userId1, String userId2) {
//     List<String> userIds = [userId1, userId2];
//     userIds.sort();
//     return '${userIds[0]}_${userIds[1]}';
//   }
// }
//
// class MessageBubble extends StatelessWidget {
//   final String text;
//   final bool isMe;
//
//   MessageBubble({required this.text, required this.isMe});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 10.0),
//       child: Row(
//         mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//               color: isMe ? Colors.blueAccent : Colors.grey[300],
//               borderRadius: isMe
//                   ? BorderRadius.only(
//                 topLeft: Radius.circular(15.0),
//                 bottomLeft: Radius.circular(15.0),
//                 topRight: Radius.circular(15.0),
//               )
//                   : BorderRadius.only(
//                 topLeft: Radius.circular(15.0),
//                 bottomRight: Radius.circular(15.0),
//                 topRight: Radius.circular(15.0),
//               ),
//             ),
//             padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
//             constraints: BoxConstraints(
//               maxWidth: MediaQuery.of(context).size.width * 0.75,
//             ),
//             child: Text(
//               text,
//               style: TextStyle(
//                 color: isMe ? Colors.white : Colors.black,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// new

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new2/models/UserModel.dart'; // Replace with your actual UserModel import
import 'package:new2/models/ChatRoomModel.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  final userModel currentUser; // Current user
  final userModel targetUser; // User with whom the current user is chatting

  ChatScreen({required this.currentUser, required this.targetUser});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  void sendMessage() {
    String messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      var timestamp = Timestamp.now();
      String roomId = _generateChatRoomId(widget.currentUser.userId!, widget.targetUser.userId!);

      // Save message in Firestore
      FirebaseFirestore.instance.collection('chatrooms').doc(roomId).collection('messages').add({
        'sender': widget.currentUser.email,
        'receiver': widget.targetUser.email,
        'text': messageText,
        'timestamp': timestamp,
        'roomid': roomId,
        'participants': {
          widget.currentUser.userId: true,
          widget.targetUser.userId: true,
        },
      });

      _messageController.clear();
    }
  }

  String _generateChatRoomId(String userId1, String userId2) {
    List<String> userIds = [userId1, userId2];
    userIds.sort(); // Sort user IDs to ensure consistency
    return '${userIds[0]}_${userIds[1]}'; // Example: 'user1_user2'
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('Chat with ${widget.targetUser.email}', style: TextStyle(color: Colors.white)),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.logout, color: Colors.white),
        //     onPressed: () async {
        //       await FirebaseAuth.instance.signOut();
        //       Navigator.popUntil(context, (route) => route.isFirst);
        //     },
        //   ),
        // ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MessageStream(currentUser: widget.currentUser, targetUser: widget.targetUser),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.deepOrangeAccent),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  final userModel currentUser;
  final userModel targetUser;

  MessageStream({required this.currentUser, required this.targetUser});

  @override
  Widget build(BuildContext context) {
    String roomId = _generateChatRoomId(currentUser.userId!, targetUser.userId!);
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('chatrooms').doc(roomId).collection('messages').orderBy('timestamp').snapshots(),
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
          final messageSenderId = message['sender'];
          final isMe = messageSenderId == currentUser.email;

          final messageBubble = MessageBubble(
            text: messageText,
            isMe: isMe,
          );
          messageBubbles.add(messageBubble);
        }

        return ListView(
          reverse: true,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          children: messageBubbles,
        );
      },
    );
  }

  String _generateChatRoomId(String userId1, String userId2) {
    List<String> userIds = [userId1, userId2];
    userIds.sort();
    return '${userIds[0]}_${userIds[1]}';
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  MessageBubble({required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: isMe ? Colors.deepOrangeAccent : Colors.grey[700],
              borderRadius: isMe
                  ? BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              )
                  : BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.white70,
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

