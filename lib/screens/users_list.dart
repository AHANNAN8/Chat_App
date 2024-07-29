// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
//
// class UserList extends StatefulWidget {
//   static const String id = 'users_list' ;
//
//   // const UserList({super.key});
//
//   @override
//   State<UserList> createState() => _UserListState();
// }
//
// class _UserListState extends State<UserList> {
//
//   //  late Map<String,dynamic> userMap ;
//   //
//   // void userList() async {
//   //   FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   //   await _firestore.collection('users').where("email").get().then((value){
//   //     setState(() {
//   //       userMap = value.docs[0].data();
//   //     });
//   //   });
//   //
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Users'),
//         backgroundColor: Colors.lightBlueAccent,
//       ),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: StreamBuilder(
//                 stream: FirebaseFirestore.instance.collection("users").where("email").snapshots(),
//                 builder: (context,snapshot){
//                 if(snapshot.connectionState == ConnectionState.active){
//                   if(snapshot.hasData){
//                      QuerySnapshot dataSnapshot = snapshot.data as QuerySnapshot ;
//
//                      if(dataSnapshot.docs.length > 0){
//                        Map<String, dynamic> userMap = dataSnapshot.docs[0].data() as Map<String, dynamic> ;
//                       for(var newemail in userMap.values ) {
//                         return ListTile(
//                           title: Text(newemail.toString()),
//                         );
//                       }
//
//                      }
//                      else{
//                        return Text("No Data !");
//                      }
//
//                   }
//                   else{
//                     return Text("Server Error");
//                   }
//
//                 }
//                 else{
//                   return CircularProgressIndicator() ;
//                 }
//                  return Container();
//                 }
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//

//   second code
//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'chat_screen.dart';
//
// class UserList extends StatefulWidget {
//   static const String id = 'users_list';
//
//   @override
//   State<UserList> createState() => _UserListState();
// }
//
// class _UserListState extends State<UserList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Users'),
//         backgroundColor: Colors.lightBlueAccent,
//       ),
//       body: SafeArea(
//
//             child: Streambuilder(),
//
//       ),
//     );
//   }
// }
//
// class Streambuilder extends StatelessWidget {
//   const Streambuilder({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('users').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           }
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }
//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Text('No Users Found');
//           }
//
//           // Process snapshot data
//           List<String> userEmails = [];
//           snapshot.data!.docs.forEach((doc) {
//             var data = doc.data() as Map<String, dynamic>;
//             String email = data['email'];
//             userEmails.add(email);
//           });
//
//           // Build ListView with user emails
//           return ListView.builder(
//             shrinkWrap: true,
//             itemCount: userEmails.length,
//
//             itemBuilder: (context, index) {
//               return SingleChildScrollView(
//                 child: GestureDetector(
//                   onTap: (){
//                     String tappedEmail = userEmails[index];
//
//                     // Navigator.pushNamed(context, ChatScreen.id);
//         Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatScreen(
//
//                   },
//                   child: Container(
//                     padding: EdgeInsets.fromLTRB(0, 9, 0, 9),
//                     alignment: Alignment.center,
//                     margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
//                    color: Colors.lightBlueAccent,
//                     child: Text(userEmails[index],
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

//  third code
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'chat_screen.dart';
//
// class UserList extends StatefulWidget {
//   static const String id = 'users_list';
//
//   @override
//   State<UserList> createState() => _UserListState();
// }
//
// class _UserListState extends State<UserList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Users'),
//         backgroundColor: Colors.lightBlueAccent,
//       ),
//       body: SafeArea(
//         child: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection('users').snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             }
//             if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             }
//             if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//               return Center(child: Text('No Users Found'));
//             }
//
//             List<String> userEmails = [];
//             snapshot.data!.docs.forEach((doc) {
//               var data = doc.data() as Map<String, dynamic>;
//               String email = data['email'];
//               userEmails.add(email);
//             });
//
//             return ListView.builder(
//               itemCount: userEmails.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     String tappedEmail = userEmails[index];
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ChatScreen(
//                            currentUser: null,
//                           targetUser: tappedEmail,
//                         ),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     padding: EdgeInsets.all(16),
//                     margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                     decoration: BoxDecoration(
//                       color: Colors.lightBlueAccent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Text(
//                       userEmails[index],
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// forth code
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:new2/models/UserModel.dart'; // Import your UserModel class
// import 'chat_screen.dart';
// import 'home_screen.dart';
//
// User? logInUser;
//
// class UserList extends StatefulWidget {
//   static const String id = 'users_list';
//
//   @override
//   State<UserList> createState() => _UserListState();
// }
//
// class _UserListState extends State<UserList> {
//   @override
//   void initState() {
//     super.initState();
//     getCurrentUser();
//   }
//
//   void getCurrentUser() async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         setState(() {
//           logInUser = user;
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: null,
//         actions: <Widget>[
//           IconButton(
//               icon: Icon(Icons.message),
//               onPressed: () {
//
//       Navigator.push(context,MaterialPageRoute(builder: (context)=> HomeScreen()));
//               }),
//
//             IconButton(
//                 icon: Icon(Icons.logout),
//                 onPressed: () async {
//                   await FirebaseAuth.instance.signOut();
//                   // messageStream();
//                   Navigator.popUntil(context, (route)=> route.isFirst);
//                 }),
//
//         ],
//
//         title: Text('Users'),
//         backgroundColor: Colors.lightBlueAccent,
//       ),
//       body: SafeArea(
//         child: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection('users').snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             }
//             if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             }
//             if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//               return Center(child: Text('No Users Found'));
//             }
//
//             List<userModel> users = snapshot.data!.docs.map((doc) {
//               var data = doc.data() as Map<String, dynamic>;
//               return userModel(
//                 userId: doc.id,
//                 email: data['email'],
//                 // Add other necessary fields from UserModel
//               );
//             }).toList();
//
//             return ListView.builder(
//               itemCount: users.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     userModel tappedUser = users[index];
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ChatScreen(
//                           targetUser: tappedUser,
//                           currentUser: userModel(
//                             userId: logInUser!.uid,
//                             email: logInUser!.email!,
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                   // child: ListTile(
//                   //
//                   //   title: Text(users[index].email),
//                   child: Container(
//                     padding: EdgeInsets.fromLTRB(0, 9, 0, 9),
//                     alignment: Alignment.center,
//                     margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
//                    color: Colors.lightBlueAccent,
//                     child: Text(users[index].email!,
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                     ),
//                     // Customize ListTile as needed
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// dummy code
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:new2/models/UserModel.dart'; // Import your UserModel class
// import 'package:new2/screens/group_chat.dart';
// import 'chat_screen.dart';
// import 'home_screen.dart';
//
// User? logInUser;
//
// class UserList extends StatefulWidget {
//   static const String id = 'users_list';
//
//   @override
//   State<UserList> createState() => _UserListState();
// }
//
// class _UserListState extends State<UserList> {
//   int _currentIndex = 0;
//
//   final List<Widget> _screens = [
//     UserListScreen(), // Define a separate widget for UserList if needed
//     HomeScreen(),
//     GroupChat(),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     getCurrentUser();
//   }
//
//   void getCurrentUser() async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         setState(() {
//           logInUser = user;
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
//
//   AppBar _buildAppBar() {
//     switch (_currentIndex) {
//       case 0:
//         return AppBar(
//           title: Text('Users'),
//           backgroundColor: Colors.lightBlueAccent,
//           actions: <Widget>[
//             // IconButton(
//             //   icon: Icon(Icons.message),
//             //   onPressed: () {
//             //     Navigator.push(
//             //       context,
//             //       MaterialPageRoute(builder: (context) => HomeScreen()),
//             //     );
//             //   },
//             // ),
//             IconButton(
//               icon: Icon(Icons.logout),
//               onPressed: () async {
//                 await FirebaseAuth.instance.signOut();
//                 Navigator.popUntil(context, (route) => route.isFirst);
//               },
//             ),
//           ],
//         );
//       case 1:
//         return AppBar(
//           title: Text('Home'),
//           backgroundColor: Colors.lightBlueAccent,
//           actions: <Widget>[
//             // Add specific actions for HomeScreen if needed
//           ],
//         );
//       case 2:
//         return AppBar(
//           title: Text('Chat Room'),
//           backgroundColor: Colors.lightBlueAccent,
//           actions: <Widget>[
//             // Add specific actions for ChatRoom if needed
//           ],
//         );
//       default:
//         return AppBar();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: _buildAppBar(),
//       body: SafeArea(
//         child: _screens[_currentIndex],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: _onItemTapped,
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list),
//             label: 'Users',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.group),
//             label: 'Chat Room',
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Define a separate widget for the UserList screen if needed
// class UserListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('users').snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//         if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         }
//         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return Center(child: Text('No Users Found'));
//         }
//
//         List<userModel> users = snapshot.data!.docs.map((doc) {
//           var data = doc.data() as Map<String, dynamic>;
//           return userModel(
//             userId: doc.id,
//             email: data['email'],
//             // Add other necessary fields from UserModel
//           );
//         }).toList();
//
//         return ListView.builder(
//           itemCount: users.length,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () {
//                 userModel tappedUser = users[index];
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ChatScreen(
//                       targetUser: tappedUser,
//                       currentUser: userModel(
//                         userId: logInUser!.uid,
//                         email: logInUser!.email!,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//               child: Container(
//                 padding: EdgeInsets.fromLTRB(0, 9, 0, 9),
//                 alignment: Alignment.center,
//                 margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
//                 color: Colors.lightBlueAccent,
//                 child: Text(
//                   users[index].email!,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

// new

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new2/models/UserModel.dart'; // Import your UserModel class
import 'package:new2/screens/group_chat.dart';
import 'chat_screen.dart';
import 'home_screen.dart';

User? logInUser;

class UserList extends StatefulWidget {
  static const String id = 'users_list';

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    UserListScreen(), // Define a separate widget for UserList if needed
    HomeScreen(),
    GroupChat(),
  ];

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        setState(() {
          logInUser = user;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  AppBar _buildAppBar() {
    switch (_currentIndex) {
      case 0:
        return AppBar(
          leading: null,
          title: Text('Users',
          style: TextStyle(color: Colors.white70),
          ),
          backgroundColor: Colors.grey[900],
          actions: <Widget>[
            IconButton(
              color: Colors.deepOrangeAccent,
              icon: Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        );
      case 1:
        return AppBar(
          title: Text('Home',
            style: TextStyle(color: Colors.white70),),
          backgroundColor: Colors.grey[900],
          actions: <Widget>[
            // Add specific actions for HomeScreen if needed
          ],
        );
      case 2:
        return AppBar(
          title: Text('Chat Room',
            style: TextStyle(color: Colors.white70),),
          backgroundColor: Colors.grey[900],
          actions: <Widget>[
            // Add specific actions for ChatRoom if needed
          ],
        );
      default:
        return AppBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: _buildAppBar(),
      body: SafeArea(
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Chat Room',
          ),
        ],
      ),
    );
  }
}

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No Users Found', style: TextStyle(color: Colors.white)));
        }

        List<userModel> users = snapshot.data!.docs.map((doc) {
          var data = doc.data() as Map<String, dynamic>;
          return userModel(
            userId: doc.id,
            email: data['email'],
            // Add other necessary fields from UserModel
          );
        }).toList();

        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                userModel tappedUser = users[index];
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(
                      targetUser: tappedUser,
                      currentUser: userModel(
                        userId: logInUser!.uid,
                        email: logInUser!.email!,
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  // contentPadding: EdgeInsets.all(2.0),
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepOrangeAccent,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    textAlign: TextAlign.center,
                    users[index].email!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}





