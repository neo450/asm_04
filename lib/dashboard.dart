import 'package:flutter/material.dart';
import 'package:project_asm4/adminpage.dart';
import 'package:project_asm4/usermanagement.dart';
import 'package:project_asm4/userpage.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
                accountName:  Text('admin'),
                accountEmail: Text('adin@gmail.com'),
                currentAccountPicture:  CircleAvatar(
                backgroundImage: NetworkImage('http://i.pravatar.cc/300'),
            ),
            ),
            ListTile(
              title: Text('UserPage'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => UserPage()));
              },
            ),
            ListTile(
              title: Text('AdminPage'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AdminPage()));
              },
            ),
            ListTile(
              title: Text('Admin Area'),
              onTap: (){
                UserManagement().authorizeAccess(context);
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: (){
                UserManagement().SignOut();
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Dashboard'),
      ),
    );
  }
}
