import 'package:bloc_tutorial/api/network_api.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(onPressed: () {
            APIRequests.getRequest('/users/page=2');
          print("Login Pressed");
          }, icon: Icon(Icons.logout),),
        ],
      ),
    );
  }
}
