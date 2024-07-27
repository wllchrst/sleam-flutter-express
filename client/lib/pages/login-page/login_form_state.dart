import 'package:client/pages/login-page/login_form.dart';
import 'package:flutter/material.dart';

class LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Form(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          decoration: const InputDecoration(
              hintText: "Email", border: OutlineInputBorder()),
          key: _formKey,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your email";
            }
            return "";
          },
        )
      ],
    ));
  }
}
