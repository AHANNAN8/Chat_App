// import 'package:new2/models/UserModel.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class FirebaseHelper {
//
//   static Future<userModel?> getUserModelById(String uid) async {
//     userModel? userModels;
//
//     DocumentSnapshot docSnap = await FirebaseFirestore.instance.collection("users").doc(uid).get();
//
//     if(docSnap.data() != null) {
//       userModels = userModel.fromMap(docSnap.data() as Map<String, dynamic>);
//     }
//
//     return userModels;
//   }
//
// }

import 'package:new2/models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {

  static Future<userModel?> getUserModelById(String uid) async {
    userModel? userModels;

    DocumentSnapshot docSnap = await FirebaseFirestore.instance.collection("users").doc(uid).get();

    if (docSnap.exists) {
      userModels = userModel(
        userId: docSnap.get('userId'),
        email: docSnap.get('email'),
      );
    }
    return userModels;
  }
}

// firebase_helper.dart

//second
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:new2/models/UserModel.dart';
//
// class FirebaseHelper {
//   static Future<userModel?> getUserModelByEmail(String email) async {
//     try {
//       final snapshot = await FirebaseFirestore.instance
//           .collection('users') // Adjust this to your actual collection name
//           .where('email', isEqualTo: email)
//           .get();
//
//       if (snapshot.docs.isNotEmpty) {
//         final userDoc = snapshot.docs.first.data();
//         return userModel.fromMap(userDoc as Map<String, dynamic>);
//       }
//     } catch (e) {
//       print('Error fetching user by email: $e');
//     }
//     return null;
//   }
// }
//third
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:new2/models/UserModel.dart'; // Adjust to the correct path
//
// class FirebaseHelper {
//   static Future<userModel?> getUserModelByEmail(String email) async {
//     try {
//       final snapshot = await FirebaseFirestore.instance
//           .collection('users') // Adjust this to your actual collection name
//           .where('email', isEqualTo: email)
//           .limit(1) // Ensure we get at most one document
//           .get();
//
//       if (snapshot.docs.isNotEmpty) {
//         final userDoc = snapshot.docs.first.data();
//         return userModel.fromMap(userDoc as Map<String, dynamic>);
//       }
//     } catch (e) {
//       print('Error fetching user by email: $e');
//     }
//     return null;
//   }

// Additional helper methods can be added here
// }

