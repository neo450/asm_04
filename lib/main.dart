import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_asm4/usermanagement.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(apiKey: 'AIzaSyCO-nRVd8wW6-q9PsznXDkXiMvrXdOs-xs', appId: 'appId', messagingSenderId: 'messagingSenderId', projectId: 'projectId')
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      home: UserManagement().handleAuth(),
    );
  }
}