import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'forgot.dart';
import 'home.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            FirebaseAuth.instance.signInWithEmailAndPassword(
                email: 'admin@gmail.com', password: '123456');
          },
          child: const Text('login',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}