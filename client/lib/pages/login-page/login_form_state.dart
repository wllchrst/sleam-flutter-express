import 'package:client/controllers/user_controllers.dart';
import 'package:client/pages/login-page/login_form.dart';
import 'package:flutter/material.dart';

class LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your email";
              }
              return null; // Return null if the input is valid
            },
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 7.5)),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              hintText: "Password",
              border: OutlineInputBorder(),
            ),
            obscureText: true, // Hides password text
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your password";
              }
              return null; // Return null if the input is valid
            },
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 7.5)),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                final email = _emailController.text;
                final password = _passwordController.text;

                final response = authenticateUser(email, password);
                print(response);
              }
            },
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
