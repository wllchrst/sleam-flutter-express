import 'package:client/pages/login-page/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(fontSize: 34),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            LoginForm()
          ],
        ),
      )),
    );
  }
}
