import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/services/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User _user;
  AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _getUserProfile();
  }

  _getUserProfile() async {
    User user = await _authService.getUserProfile();
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: _user == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Name: ${_user.name}', style: TextStyle(fontSize: 20)),
                  Text('Email: ${_user.email}', style: TextStyle(fontSize: 20)),
                  Text('Phone: ${_user.phone}', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
    );
  }
}