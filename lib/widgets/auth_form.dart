import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokedex2/screen/home_screen.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  late bool _islogin = true;
  final emailCT = TextEditingController();
  final passwordCT = TextEditingController();
  String errorMessage = ' ';

  @override
  void dispose() {
    emailCT.dispose();
    passwordCT.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    controller: emailCT,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Email address',
                    ),
                  ),
                  TextFormField(
                    controller: passwordCT,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: Text(errorMessage),
                  ),
                  ElevatedButton(
                    onPressed: signIn,
                    child: Text(_islogin ? 'Login' : 'Register'),
                  ),
                  TextButton(
                    child: const Text('Create new account'),
                    onPressed: () {
                      setState(() {
                        _islogin = !_islogin;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    final mail = emailCT.text;
    final pass = passwordCT.text;
    if (_islogin) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: mail, password: pass);
        errorMessage = ' ';
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      } on FirebaseAuthException catch (e) {
        errorMessage = e.message.toString();
      }
    } else {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: mail, password: pass);
        errorMessage = ' ';
      } on FirebaseAuthException catch (e) {
        errorMessage = e.message.toString();
      }
    }
  }
}
