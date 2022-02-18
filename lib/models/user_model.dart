import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userId;
  final String fullName;
  final String email;
  final String profilePic;
  final String phoneNumber;
  final String address;
  final String password;
  final Timestamp createdAt;
  final bool isOnline;
  final Timestamp lastSeen;

  UserModel({
    this.userId,
    this.fullName,
    this.email,
    this.profilePic,
    this.phoneNumber,
    this.address,
    this.password,
    this.createdAt,
    this.isOnline,
    this.lastSeen,
  });
}
