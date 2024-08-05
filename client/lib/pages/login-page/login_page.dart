import 'dart:io';

import 'package:client/pages/login-page/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/steam-logo.png',
              width: 300,
              height: 300,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
            const LoginForm()
          ],
        ),
      )),
    );
  }
}
