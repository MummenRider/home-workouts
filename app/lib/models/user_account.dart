import 'package:flutter/material.dart';

class UserAccount {
  final String firstName;
  final String lastName;
  final String email;
  final String userId;

  UserAccount({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.userId,
  });

  factory UserAccount.fromJSON(Map<String, dynamic> json) {
    if (json == null) return null;

    return UserAccount(
      userId: json['userId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJSON() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'userId': userId,
      };

  @override
  int get hashCode =>
      firstName.hashCode ^ lastName.hashCode ^ email.hashCode ^ userId.hashCode;

  @override
  bool operator ==(other) {
    return (other is UserAccount) &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.userId == userId;
  }
}
