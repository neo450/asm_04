import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
String adminRole = "system administrator";
String user = "user";
String role = "Role";
String userEmail = "Email";

void changeUserRole (String selectedRole, String selectedEmail) {

}

void handleSubmitChangeRole (String currentEmail, String userEmail, String userRoleChanged) {
  String currentRole = "";
  QuerySnapshot querySnapshot = getUserData(currentEmail).then((results)=> results) as QuerySnapshot<Object>;
  currentRole = querySnapshot.docs[0].get(role);
  if (currentRole != adminRole) return;
  // Update user by searching emails
  if (userEmail == querySnapshot.docs[0].get(userEmail) && currentRole == adminRole) {
    changeUserRole(userRoleChanged, userEmail);
  }
}

Future getUserData (String userEmail)async {
  return await FirebaseFirestore.instance.collection(user).get();
}