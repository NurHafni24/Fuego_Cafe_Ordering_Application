// ignore_for_file: avoid_print

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fuego_cafe/design_utils/constants.dart';
import 'package:fuego_cafe/register_screen.dart';
import 'package:fuego_cafe/table.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authentication = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;
  var rememberValue = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,   
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'FUEGO CAFE \n\nSign in',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: black, fontWeight: FontWeight.w700, fontSize: 30
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    validator: (value) {
                      if (!EmailValidator.validate(value.toString())) {
                        return 'Please enter a valid email';
                      } else {
                        _email = value.toString();
                      }
                      return null;
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: 'Enter your email',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      prefixIcon: const Icon(Icons.email,
                      color:Color.fromARGB(255, 241, 132, 7)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(color: Color.fromARGB(255, 3, 1, 0)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else {
                        _password = value;
                      }
                      return null;
                    },
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock,
                      color:Color.fromARGB(255, 241, 132, 7)),
                      labelText: 'Enter your password',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authentication
                            .signInWithEmailAndPassword(
                                email: _email, 
                                password: _password
                            )
                            .then(
                              (_) => {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Login succesfully'),
                                      backgroundColor: Colors.green),
                                ),
                                 _navigateToNextScreen(context)                              
                              },
                            )
                            .onError(
                              (error, stackTrace) => {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('wrong email or password'),
                                      backgroundColor: Colors.red
                                  ),
                                )
                              },
                            );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 241, 132, 7),
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                    ),
                    child: Text(
                      'Sign in',
                      style: themeData.textTheme.bodyText1
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Not registered yet?',
                        style: TextStyle(
                          color: black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(
                                  title: 'Register Page'), //call register_screen.dart
                            ),
                          );
                        },
                        child: const Text('Create an account'),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

//To go to table page (Nuri's page)
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TableApp()));
  }
}