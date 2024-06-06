import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ibreez/model/user_model.dart';
import 'package:flutter/material.dart';
import '../screen/admin_home.dart';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final _db = FirebaseFirestore.instance;

  /// signUpWithEmailPassword
  Future<User?> signUpWithEmailPassword(
    String email,
    String password,
    String phoneNo,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      if (user != null) {
        UserModel userModel = UserModel(
            uid: user.uid,
            email: user.email,
            password: password,
            phoneNo: phoneNo);

        await _fireStore
            .collection('Users')
            .doc(user.uid)
            .set(userModel.toJson());
        return user;
      }
    } on FirebaseAuthException catch (e) {
      print('Error:$e');
    }
    return null;
  }

  /// getLoginUser
  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  /// signInWithEmailandPassword
  Future<UserModel?> signInWithEmailandPassword(
    BuildContext context,
    String email,
    String password,
  ) async {
    var result = await _fireStore
        .collection('Admin')
        .where("email", isEqualTo: email)
        .where("password", isEqualTo: password)
        .get();

    if (result.docs.isNotEmpty) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Homepage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email or password')));
    }
    return null;
  }
}
