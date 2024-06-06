import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final String? email;
  final String? phoneNo;
  final String? password;

  UserModel({
    this.uid,
    this.email,
    this.phoneNo,
    this.password,
  });

  toJson() {
    return {
      "uid": uid,
      "email": email,
      "phoneno": phoneNo,
      "password": password,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        uid: document.id,
        email: data["email"],
        password: data["password"],
        phoneNo: data['phoneno']);
  }

  factory UserModel.fromSnapshotAdmin(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        uid: document.id, email: data["email"], password: data["password"]);
  }
}
