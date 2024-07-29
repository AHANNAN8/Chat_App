// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:new2/models/FirebaseHelper.dart';
// import 'package:new2/models/UserModel.dart';
// import 'package:new2/models/ChatRoomModel.dart';
//
//  User? loginUser ;
//
// class HomeScreen extends StatefulWidget {
//   final userModel usermodel ;
//
//   const HomeScreen({super.key, required this.usermodel});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   final _auth = FirebaseAuth.instance ;
//
//   @override
//   void initState(){
//     super.initState();
//     getCurrentUser();
//   }
//   void getCurrentUser() async {
//     try {
//       final user = await _auth.currentUser;
//       if(user != null){
//         loginUser = user ;
//         print(loginUser!.uid);
//       }
//     }
//     catch(e){
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//
//       ),
//       body: SafeArea(
//         child: Container(
//           child: StreamBuilder(
//             stream: FirebaseFirestore.instance.collection("chatrooms").where("partisipants.${loginUser!.uid}", isEqualTo: true).snapshots(),
//             builder: (context, snapshot){
//               if(snapshot.connectionState == ConnectionState.active){
//                 if(snapshot.hasData){
//                    QuerySnapshot chatRoomSnapshot = snapshot.data as QuerySnapshot ;
//
//                    return ListView.builder(
//                         itemCount: chatRoomSnapshot.docs.length ,
//                         itemBuilder: (context, index){
//                          ChatRoomModel.chatRoomModel =ChatRoomModel.fromMap (chatRoomSnapshot.docs[index].data() as Map<String,dynamic>);
//
//                          Map<String, dynamic> partisipants = chatRoomModel.users as Map<String, dynamic>;
//                          List<String> partisipantKey = partisipants.keys.toList();
//                          partisipantKey.remove(widget.usermodel.userId);
//
//                          return FutureBuilder(
//                            future: FirebaseHelper.getUserModelById(partisipantKey[0]),
//                            builder: (context, userData){
//                              userModel targetUser = userData.data as userModel ;
//
//                             return ListTile(
//                               leading: Icon(Icons.message),
//                               title: Text(targetUser.email.toString()),
//                               // subtitle: Text(chatRoomModel.lastMessage.toString()),
//                             );
//
//                            },
//                          );
//
//                         },
//                    );
//                 }
//                 else if(snapshot.hasError){
//                   return Center(
//                     child: Text(snapshot.error.toString()),
//                   );
//                 }
//                 else{
//                   return Center(
//                     child: Text('No Chats'),
//                   );
//                 }
//               }
//               else{
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//
//             },
//
//
//           ),
//         ),
//       ),
//     );
//   }
// }

// second code

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:new2/models/FirebaseHelper.dart';
// import 'package:new2/models/UserModel.dart' as userModel; // Use 'as' to avoid naming conflicts
// import 'package:new2/models/ChatRoomModel.dart' as ChatRoomModel;
// import 'package:new2/screens/group_chat.dart';
//
// import '../models/ChatRoomModel.dart';
// import '../models/UserModel.dart';
//
//  User? loginUser ;
//
// var Chatroommodel = chatRoomModel() ;
//
// class HomeScreen extends StatefulWidget {
//   final userModel.userModel? usermodel;
//
//   HomeScreen({ this.usermodel});
//   // const HomeScreen({Key? key, required this.usermodel}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final _auth = FirebaseAuth.instance ;
//
//   @override
//   void initState(){
//     super.initState();
//     getCurrentUser();
//   }
//   void getCurrentUser() async {
//     try {
//       final user = await _auth.currentUser;
//       if(user != null){
//         loginUser = user ;
//         print(loginUser!.uid);
//       }
//     }
//     catch(e){
//       print(e);
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
//               icon: Icon(Icons.logout),
//               onPressed: ()  {
//                 // await FirebaseAuth.instance.signOut();
//                 // messageStream();
//                 // Navigator.popUntil(context, (route)=> route.isFirst);
//                 print(Chatroommodel.chatroomid) ;
//               }),
//         ],
//         title: Text('Chats'),
//       ),
//       body: SafeArea(
//         child: Container(  //chatrooms.${widget.usermodel!.userId
//           child: StreamBuilder<QuerySnapshot>(
//               stream:  FirebaseFirestore.instance.collection("chatrooms").where("participants.${loginUser?.uid}", isEqualTo: true).snapshots(),
//             builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//
//               if (snapshot.hasError) {
//                 return Center(
//                   child: Text('Error: ${snapshot.error}'),
//                 );
//               }
//
//               if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
//                 List<DocumentSnapshot> chatRoomDocs = snapshot.data!.docs;
//
//                 return ListView.builder(
//                   itemCount: chatRoomDocs.length,
//                   itemBuilder: (context, index) {
//                     Chatroommodel = chatRoomModel.fromMap(chatRoomDocs[index].data() as Map<String, dynamic>);
//
//                     Map<String, dynamic> participants = Chatroommodel.participants as Map<String, dynamic>;
//                     List<String> participantKeys = participants.keys.toList();
//                     participantKeys.remove(widget.usermodel!.userId);
//
//                     return FutureBuilder<userModel.userModel?>(
//                       future: FirebaseHelper.getUserModelById(participantKeys[0]),
//                       builder: (context, AsyncSnapshot<userModel.userModel?> userData) {
//                         if (userData.connectionState == ConnectionState.waiting) {
//                           return ListTile(
//                             leading: Icon(Icons.message),
//                             title: Text('Loading...'),
//                           );
//                         }
//
//                         if (userData.hasError || userData.data == null) {
//                           return ListTile(
//                             leading: Icon(Icons.error),
//                             title: Text('Error loading user'),
//                           );
//                         }
//
//                         userModel.userModel targetUser = userData.data!;
//                         print(userModel.userModel) ;
//
//                         return ListTile(
//                           leading: Icon(Icons.message),
//                           // subtitle: Text(targetUser?.email ?? 'No email'),
//                           // subtitle: Text(chatRoomModel.lastMessage ?? 'No message'),
//                           // title: Text(chatRoomModel.participants.toString() ?? 'No message'),
//                           title: Text(Chatroommodel.chatroomid.toString()),
//
//
//                         );
//                       },
//                     );
//                   },
//                 );
//               }
//
//               return Center(
//                 child: Text('No Chats'),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// third code

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:new2/models/FirebaseHelper.dart';
// import 'package:new2/models/UserModel.dart' as userModel; // Use 'as' to avoid naming conflicts
// import 'package:new2/models/ChatRoomModel.dart' as ChatRoomModel; // Use 'as' to avoid naming conflicts
//
// class HomeScreen extends StatefulWidget {
//   final userModel.userModel? usermodel;
//
//   HomeScreen({this.usermodel});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     if (widget.usermodel == null || widget.usermodel!.userId == null) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Chats'),
//         ),
//         body: Center(
//           child: Text('User data not available'),
//         ),
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chats'),
//       ),
//       body: SafeArea(
//         child: Container(
//           child: StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance
//                 .collection("chatrooms")
//                 .where("participants.${widget.usermodel?.userId}", isEqualTo: true)
//                 .snapshots(),
//             builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//
//               if (snapshot.hasError) {
//                 return Center(
//                   child: Text('Error: ${snapshot.error}'),
//                 );
//               }
//
//               if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                 return Center(
//                   child: Text('No Chats'),
//                 );
//               }
//
//               List<DocumentSnapshot> chatRoomDocs = snapshot.data!.docs;
//
//               return ListView.builder(
//                 itemCount: chatRoomDocs.length,
//                 itemBuilder: (context, index) {
//                   ChatRoomModel.ChatRoomModel chatRoomModel =
//                   ChatRoomModel.ChatRoomModel.fromMap(chatRoomDocs[index].data() as Map<String, dynamic>);
//
//                   return FutureBuilder<QuerySnapshot>(
//                     future: FirebaseFirestore.instance
//                         .collection("chatrooms")
//                         .doc(chatRoomModel.chatroomid) // Assuming you have an 'id' field in ChatRoomModel
//                         .collection("messages")
//                         .orderBy('timestamp', descending: true) // Adjust the orderBy as per your requirement
//                         .get(),
//                     builder: (context, AsyncSnapshot<QuerySnapshot> messageSnapshot) {
//                       if (messageSnapshot.connectionState == ConnectionState.waiting) {
//                         return ListTile(
//                           title: Text('Loading messages...'),
//                         );
//                       }
//
//                       if (messageSnapshot.hasError) {
//                         return ListTile(
//                           title: Text('Error loading messages: ${messageSnapshot.error}'),
//                         );
//                       }
//
//                       if (!messageSnapshot.hasData || messageSnapshot.data!.docs.isEmpty) {
//                         return ListTile(
//                           title: Text('No messages'),
//                         );
//                       }
//
//                       List<DocumentSnapshot> messageDocs = messageSnapshot.data!.docs;
//
//                       // Get the last message
//                       DocumentSnapshot lastMessage = messageDocs.first;
//
//                       return ListTile(
//                         leading: Icon(Icons.message),
//                         title: Text('Last message: ${lastMessage['text']}'), // Example: accessing the 'text' field
//                         subtitle: Text('Sent by: ${lastMessage['senderId']}'), // Example: accessing the 'senderId' field
//                       );
//                     },
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// forth code

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:new2/models/FirebaseHelper.dart';
// import 'package:new2/models/UserModel.dart' as userModel; // Use 'as' to avoid naming conflicts
// import 'package:new2/screens/group_chat.dart';
// // import 'package:new2/models/ChatRoomModel.dart' as ChatRoomModel;
//
// import '../models/ChatRoomModel.dart';
//
// final _fireStore = FirebaseFirestore.instance;
//
//  User? loginUser ;
//
// var Chatroommodel = chatRoomModel() ;
//
// class HomeScreen extends StatefulWidget {
//   final userModel.userModel? usermodel;
//
//   HomeScreen({ this.usermodel});
//   // const HomeScreen({Key? key, required this.usermodel}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   final _auth = FirebaseAuth.instance ;
//
//   @override
//   void initState(){
//     super.initState();
//     getCurrentUser();
//   }
//   void getCurrentUser() async {
//     try {
//       final user = await _auth.currentUser;
//       if(user != null){
//         loginUser = user ;
//         print(loginUser!.uid);
//       }
//     }
//     catch(e){
//       print(e);
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
//               icon: Icon(Icons.logout),
//               onPressed: ()  {
//                 // await FirebaseAuth.instance.signOut();
//                 // messageStream();
//                 // Navigator.popUntil(context, (route)=> route.isFirst);
//                 print(Chatroommodel.chatroomid) ;
//               }),
//         ],
//         title: Text('Chats'),
//       ),
//       body: SafeArea(
//           // where("participants" == logInUser!.uid).
//           // List<String> participantKeys = participants.keys.toList();
//           child: StreamBuilder<QuerySnapshot>(
//             stream:  _fireStore.collection('chatrooms').where('reciver', isEqualTo: loginUser?.uid ).snapshots(),
//             builder: (context, snapshot) {
//               // print(snapshot) ;
//               final users = snapshot.data!.docs;
//               List<PrintValue> myvalue = [] ;
//               for(var user in users) {
//                 final myUser = user['text'];
//                 // final currentUser = loginUser?.email ;
//
//                  final printValue = PrintValue (
//                    email: myUser,
//                  );
//
//                 myvalue.add(printValue);
//                 print(myUser) ;
//               }
//
//               return ListView(
//                 children: myvalue,
//               );
//
//               // if (snapshot.connectionState == ConnectionState.waiting) {
//               //   return Center(
//               //     child: CircularProgressIndicator(),
//               //   );
//               // }
//               //
//               // if (snapshot.hasError) {
//               //   return Center(
//               //     child: Text('Error: ${snapshot.error}'),
//               //   );
//               // }
//               //
//               // if (snapshot.hasData) {
//               //   List<DocumentSnapshot> chatRoomDocs = snapshot.data!.docs;
//               //   print(chatRoomDocs);
//
//               //   return Container(
//               //     child: Text(myUser),
//               //   );
//               // }
//
//               //
//               //
//               //   return ListView.builder(
//               //     itemCount: chatRoomDocs.length,
//               //     itemBuilder: (context, index) {
//               //       Chatroommodel = chatRoomModel.fromMap(chatRoomDocs[index].data() as Map<String, dynamic>);
//               //
//               //       Map<String, dynamic> participants = Chatroommodel.participants as Map<String, dynamic>;
//               //       List<String> participantKeys = participants.keys.toList();
//               //       participantKeys.remove(loginUser!.uid);
//               //
//               //       return FutureBuilder<userModel.userModel?>(
//               //         future: FirebaseHelper.getUserModelById(participantKeys[0]),
//               //         builder: (context, AsyncSnapshot<userModel.userModel?> userData) {
//               //           if (userData.connectionState == ConnectionState.waiting) {
//               //             return ListTile(
//               //               leading: Icon(Icons.message),
//               //               title: Text('Loading...'),
//               //             );
//               //           }
//               //
//               //           if (userData.hasError || userData.data == null) {
//               //             return ListTile(
//               //               leading: Icon(Icons.error),
//               //               title: Text('Error loading user'),
//               //             );
//               //           }
//               //
//               //           userModel.userModel targetUser = userData.data!;
//               //           // print(userModel.userModel) ;
//               //
//               //           return ListTile(
//               //             leading: Icon(Icons.message),
//               //             subtitle: Text(targetUser?.email ?? 'No email'),
//               //             // subtitle: Text(chatRoomModel.lastMessage ?? 'No message'),
//               //             // title: Text(chatRoomModel.participants.toString() ?? 'No message'),
//               //             title: Text(Chatroommodel.chatroomid.toString()),
//               //
//               //
//               //           );
//               //         },
//               //       );
//               //     },
//               //   );
//               // }
//               //
//               // return Center(
//               //   child: Text('No Chats'),
//               // );
//             },
//           ),
//
//       ),
//     );
//   }
// }
//
// class PrintValue extends StatelessWidget {
//    PrintValue({required this.email});
//
//   final String email;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(email),
//       ],
//     );
//   }
// }

// dummu code

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:new2/models/FirebaseHelper.dart';
// import 'package:new2/models/UserModel.dart'; // Use 'as' to avoid naming conflicts
// import 'package:new2/screens/group_chat.dart';
// import 'package:new2/models/ChatRoomModel.dart' as ChatRoomModel;
//
// import '../models/ChatRoomModel.dart';
//
// final _fireStore = FirebaseFirestore.instance;
//
//  User? loginUser ;
//
//  final roomId = TargetUser();
//
// var Chatroommodel = chatRoomModel() ;
//
// class HomeScreen extends StatefulWidget {
//   final userModel? Usermodel;
//
//   HomeScreen({ this.Usermodel});
//   // const HomeScreen({Key? key, required this.usermodel}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   final _auth = FirebaseAuth.instance ;
//
//   @override
//   void initState(){
//     super.initState();
//     getCurrentUser();
//   }
//   void getCurrentUser() async {
//     try {
//       final user = await _auth.currentUser;
//       if(user != null){
//         loginUser = user ;
//         print(loginUser!.uid);
//       }
//     }
//     catch(e){
//       print(e);
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
//               icon: Icon(Icons.logout),
//               onPressed: ()  {
//                 // await FirebaseAuth.instance.signOut();
//                 // messageStream();
//                 // Navigator.popUntil(context, (route)=> route.isFirst);
//                 print(Chatroommodel.chatroomid) ;
//               }),
//         ],
//         title: Text('Chats'),
//       ),
//       body: SafeArea(
//           // where("participants" == logInUser!.uid).
//           // List<String> participantKeys = participants.keys.toList();
//           // child: StreamBuilder<QuerySnapshot>(
//           //   stream:  _fireStore.collection('chatrooms').doc(roomId.toString()).collection('messages').where('participants.${loginUser!.uid}', isEqualTo: true ).snapshots(),
//           //   builder: (context, snapshot) {
//           //     // print(snapshot) ;
//           //     final users = snapshot.data!.docs;
//           //     List<PrintValue> myvalue = [] ;
//           //     for(var user in users) {
//           //       final myUser = user['sender'];
//           //       // final currentUser = loginUser?.email ;
//           //
//           //        final printValue = PrintValue (
//           //          email: myUser,
//           //        );
//           //
//           //       myvalue.add(printValue);
//           //       print(myUser) ;
//           //     }
//
//               child:  SingleChildScrollView(
//                 child: TargetUser(),
//               ),
//
//               // if (snapshot.connectionState == ConnectionState.waiting) {
//               //   return Center(
//               //     child: CircularProgressIndicator(),
//               //   );
//               // }
//               //
//               // if (snapshot.hasError) {
//               //   return Center(
//               //     child: Text('Error: ${snapshot.error}'),
//               //   );
//               // }
//               //
//               // if (snapshot.hasData) {
//               //   List<DocumentSnapshot> chatRoomDocs = snapshot.data!.docs;
//               //   print(chatRoomDocs);
//
//               //   return Container(
//               //     child: Text(myUser),
//               //   );
//               // }
//
//               //
//               //
//               //   return ListView.builder(
//               //     itemCount: chatRoomDocs.length,
//               //     itemBuilder: (context, index) {
//               //       Chatroommodel = chatRoomModel.fromMap(chatRoomDocs[index].data() as Map<String, dynamic>);
//               //
//               //       Map<String, dynamic> participants = Chatroommodel.participants as Map<String, dynamic>;
//               //       List<String> participantKeys = participants.keys.toList();
//               //       participantKeys.remove(loginUser!.uid);
//               //
//               //       return FutureBuilder<userModel.userModel?>(
//               //         future: FirebaseHelper.getUserModelById(participantKeys[0]),
//               //         builder: (context, AsyncSnapshot<userModel.userModel?> userData) {
//               //           if (userData.connectionState == ConnectionState.waiting) {
//               //             return ListTile(
//               //               leading: Icon(Icons.message),
//               //               title: Text('Loading...'),
//               //             );
//               //           }
//               //
//               //           if (userData.hasError || userData.data == null) {
//               //             return ListTile(
//               //               leading: Icon(Icons.error),
//               //               title: Text('Error loading user'),
//               //             );
//               //           }
//               //
//               //           userModel.userModel targetUser = userData.data!;
//               //           // print(userModel.userModel) ;
//               //
//               //           return ListTile(
//               //             leading: Icon(Icons.message),
//               //             subtitle: Text(targetUser?.email ?? 'No email'),
//               //             // subtitle: Text(chatRoomModel.lastMessage ?? 'No message'),
//               //             // title: Text(chatRoomModel.participants.toString() ?? 'No message'),
//               //             title: Text(Chatroommodel.chatroomid.toString()),
//               //
//               //
//               //           );
//               //         },
//               //       );
//               //     },
//               //   );
//               // }
//               //
//               // return Center(
//               //   child: Text('No Chats'),
//               // );
//             // },
//           // ),
//
//       ),
//     );
//   }
// }
//
//
// // target user
//
//
// class TargetUser extends StatelessWidget {
//
//   final userModel? targetUser;
//
//    TargetUser({this.targetUser});
//
//   @override
//   Widget build(BuildContext context) {
//     String roomId = _generateChatRoomId(loginUser!.uid, targetUser!.userId!);
//
//   return  StreamBuilder<QuerySnapshot>(
//         stream:  _fireStore.collection('chatrooms').doc(roomId).collection('messages').where('receiver.${loginUser!.email}', isEqualTo: true).snapshots(),
//         builder: (context, snapshot) {
//           // print(snapshot) ;
//           final users = snapshot.data!.docs;
//           List<PrintValue> myvalue = [];
//           for (var user in users) {
//             final myUser = user['sender'];
//             // final currentUser = loginUser?.email ;
//
//             final printValue = PrintValue(
//               email: myUser,
//             );
//
//             myvalue.add(printValue);
//             print(myUser);
//           }
//
//           return ListView(
//             children: myvalue,
//           );
//           // return Container();
//         }
//           );
//   }
//     String _generateChatRoomId(String userId1, String userId2) {
//       List<String> userIds = [userId1, userId2];
//       userIds.sort();
//       return '${userIds[0]}_${userIds[1]}';
//     }
// }
//
// class PrintValue extends StatelessWidget {
//   PrintValue({required this.email});
//
//   final String email;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(email),
//       ],
//     );
//   }
// }

// dummy 2 code

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:new2/models/UserModel.dart'; // Ensure this path is correct
// import '../models/ChatRoomModel.dart'; // Ensure this path is correct
//
// User? loginUser;
// final _fireStore = FirebaseFirestore.instance;
//
// class HomeScreen extends StatefulWidget {
//   final userModel? UserModel;
//
//   HomeScreen({this.UserModel});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final _auth = FirebaseAuth.instance;
//   User? loginUser;
//
//   @override
//   void initState() {
//     super.initState();
//     getCurrentUser();
//   }
//
//   void getCurrentUser() async {
//     try {
//       final user = _auth.currentUser;
//       if (user != null) {
//         setState(() {
//           loginUser = user;
//         });
//         print(loginUser!.uid);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Ensure loginUser is not null before rendering
//     if (loginUser == null) {
//       return Scaffold(
//         appBar: AppBar(
//           leading: null,
//           actions: <Widget>[
//             IconButton(
//               icon: Icon(Icons.logout),
//               onPressed: () {
//                 // Handle logout
//               },
//             ),
//           ],
//           title: Text('Chats'),
//         ),
//         body: Center(child: CircularProgressIndicator()), // Show loading indicator while fetching user
//       );
//     }
//
//     return Scaffold(
//       // appBar: AppBar(
//       //   leading: null,
//       //   actions: <Widget>[
//       //     IconButton(
//       //       icon: Icon(Icons.logout),
//       //       onPressed: () {
//       //         // Handle logout
//       //       },
//       //     ),
//       //   ],
//       //   title: Text('Chats'),
//       // ),
//       body: SafeArea(
//         // child: SingleChildScrollView(
//           child: Text('This Page Under Devlopment'),
//         // ),
//       ),
//     );
//   }
// }

// class TargetUser extends StatelessWidget {
//   final userModel? targetUser;
//   // final User? loginUser;
//
//   TargetUser({ this.targetUser});
//
//   @override
//   Widget build(BuildContext context) {
//     // if (targetUser == null) {
//     //   return Center(child: Text('No target user selected.'));
//     // }
//
//     String roomId = _generateChatRoomId(loginUser!.uid, targetUser!.userId!);
//
//     // return StreamBuilder<QuerySnapshot>(
//     //  stream: _fireStore
//     //       .collection('chatrooms')
//     //       .doc(roomId)
//     //       .collection('messages')
//     //       .snapshots(),
//
//         // , builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {  },final users = snapshot.data!.docs;
//         print(users);
//         List<PrintValue> myValue = [];
//         for (var user in users) {
//           final myUser = user['receiver'];
//           final printValue = PrintValue(
//             email: myUser,
//           );
//
//           myValue.add(printValue);
//           print(myUser);
//         }
//
//         return ListView(
//           children: myValue,
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
// class PrintValue extends StatelessWidget {
//   final String email;
//
//   PrintValue({required this.email});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(email),
//       ],
//     );
//   }
// }


//test code
// Future<void> _userDetails(userID) async {
//   final userDetails = await getData(userID);
//   setState(() {
//     firstName =  userDetails.toString();
//     new Text(firstName);
//   });
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new2/models/UserModel.dart'; // Ensure this path is correct
import '../models/ChatRoomModel.dart'; // Ensure this path is correct

User? loginUser;
final _fireStore = FirebaseFirestore.instance;

class HomeScreen extends StatefulWidget {
  final userModel? UserModel;

  HomeScreen({this.UserModel});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  User? loginUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        setState(() {
          loginUser = user;
        });
        print(loginUser!.uid);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Ensure loginUser is not null before rendering
    if (loginUser == null) {
      return Scaffold(
        // backgroundColor: Colors.grey[850],
        appBar: AppBar(
          // backgroundColor: Colors.grey[900],
          leading: null,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.logout, color: Colors.white),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
          title: Text('Chats', style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
          ),
        ), // Show loading indicator while fetching user
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[850],
      // appBar: AppBar(
      //   backgroundColor: Colors.grey[900],
      //   leading: null,
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.logout, color: Colors.white),
      //       onPressed: () async {
      //         await FirebaseAuth.instance.signOut();
      //         Navigator.popUntil(context, (route) => route.isFirst);
      //       },
      //     ),
      //   ],
      //   title: Text('Home', style: TextStyle(color: Colors.white)),
      // ),
      body: Container(

        child: SafeArea(
          // child: Padding(
          //   padding: EdgeInsets.all(16.0),
          //   child: Column(
          //     children: [
          //       Expanded(
                  child: Center(
                    child: Text(
                      'This Page Under Development',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
          //       ),
          //       // Add more widgets or UI elements here
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}








