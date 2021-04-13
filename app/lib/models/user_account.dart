import 'package:flutter/material.dart';

class UserAccount {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String displayProfileURL;
  final String userId;
  final String aboutMe;
  final String caloriesGoal;
  final String currentKcal;
  UserAccount({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.phoneNumber,
    @required this.userId,
    @required this.displayProfileURL,
    @required this.aboutMe,
    this.caloriesGoal = "2300",
    this.currentKcal = "0",
  });

  factory UserAccount.fromJSON(Map<String, dynamic> json) {
    if (json == null) return null;

    return UserAccount(
      userId: json['userId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phone'],
      displayProfileURL: json['displayProfileURL'],
      aboutMe: json['aboutMe'],
      caloriesGoal: json['caloriesGoal'],
      currentKcal: json['currentKcal'],
    );
  }

  Map<String, dynamic> toJSON() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phone': phoneNumber,
        'userId': userId,
        'displayProfileURL': displayProfileURL,
        'aboutMe': aboutMe,
        'caloriesGoal': caloriesGoal,
        'currentKcal': currentKcal,
      };

  @override
  int get hashCode =>
      firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      userId.hashCode ^
      displayProfileURL.hashCode ^
      phoneNumber.hashCode;

  @override
  bool operator ==(other) {
    return (other is UserAccount) &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.displayProfileURL == displayProfileURL &&
        other.userId == userId;
  }
}
