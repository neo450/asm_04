
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_asm4/login.dart';
import 'adminpage.dart';
import 'dashboard.dart';

class UserManagement {
  handleAuth(){
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if(snapshot.hasData) {
            return DashboardPage();
          }
          return LoginPage();
        },
    );
  }

  authorizeAccess(BuildContext context){
    FirebaseAuth.instance.currentUser.then((user) {
      FirebaseFirestore.instance.collection('/user').where('uid', isEqualTo: user.uid).getDocuments().then((docs){
        if (docs.documents[0].exists) {
          if(docs.documents[0].data['role']=='admin') {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => AdminPage()));
          }
          else {
            print('Not Authorized');
          }
        }
      });
    });
  }

  SignOut(){
    FirebaseAuth.instance.signOut();
  }
}
