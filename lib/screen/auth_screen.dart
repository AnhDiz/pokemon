import 'package:flutter/material.dart';
import 'package:pokedex2/widgets/auth_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Colors.greenAccent,
            Color.fromARGB(183, 255, 255, 255)
          ])),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: AuthForm(),
      ),
    );
  }
}
