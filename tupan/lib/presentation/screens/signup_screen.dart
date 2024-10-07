import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  static const String NAME = "signup_screen";
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Text("Sign in"),
      ),
    );
  }
}
