import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class userModel {

  final String? userId;
  final String? email;
  // final String userName;

  userModel({required this.userId, required this.email});

  factory userModel.fromMap(Map<String, dynamic> data) {
    return userModel(
      userId: data['userId'] ?? '',   // Ensure 'userId' is present in your data map
      email: data['email'] ?? '',     // Ensure 'email' is present in your data map
    );
  }

  }

// ChatRoomModel class (example)

//   class ChatRoomModel {
//   final String roomId;
//   final List<String> users; // List of user IDs
//
//   ChatRoomModel({required this.roomId, required this.users});
//
// }

// class ChatRoomModel {
//   String roomId;
//   String roomName;
//   List<String> users;
//
//   ChatRoomModel({
//     required this.roomId,
//     required this.roomName,
//     required this.users,
//   });
//
//   factory ChatRoomModel.fromMap(Map<String, dynamic> map) {
//     return ChatRoomModel(
//       roomId: map['roomId'] ?? '',
//       roomName: map['roomName'] ?? '',
//       users: List<String>.from(map['users'] ?? []),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class userModel {
//   final String? userId;
//   final String? email;
//
//   userModel({
//      this.userId,
//      this.email,
//   });
//
//   factory userModel.fromMap(Map<String, dynamic> data) {
//     return userModel(
//       userId: data['userId'] ?? '', // Adjust field names if necessary
//       email: data['email'] ?? '',
//     );
//   }
//
//   // Optionally, you can add toMap method if needed for uploading data
//   Map<String, dynamic> toMap() {
//     return {
//       'userId': userId,
//       'email': email,
//     };
//   }
// }
