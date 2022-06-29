import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fuego_cafe/design_utils/constants.dart';
import 'package:fuego_cafe/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late String _email, _password;
  final authentication = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;

  bool confirmPassword(password, confirmpassword) {
    return password == confirmpassword;
  }

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
              'Sign up',
              style: TextStyle(
                color: black, fontWeight: FontWeight.w700, fontSize: 30
              ),
            ),
            const Text(
              'To Use Our Service',
              style: TextStyle(
                color: black, fontWeight: FontWeight.w700, fontSize: 20
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
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
                      labelText: 'Email',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      prefixIcon: const Icon(Icons.email,
                      color:Color.fromARGB(255, 241, 132, 7)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Color.fromARGB(255, 3, 1, 0)),
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
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
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
                    style: const TextStyle(color: Color.fromARGB(255, 3, 1, 0)),
                    validator: (value) {
                      if (!confirmPassword(_password, value)) {
                        return 'Password not matched';
                      }
                      return null;
                    },
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock,
                      color:Color.fromARGB(255, 241, 132, 7)),
                      labelText: 'Confirm password',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authentication.createUserWithEmailAndPassword(
                            email: _email, password: _password
                          )
                          .then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                 content: Text('Account created succesfully'),
                                backgroundColor: Colors.green
                              ),
                            );
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 241, 132, 7),                      
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                    ),
                    child: const Text('Sign up',
                      style: TextStyle(
                        color: white, fontSize: 15, fontWeight: FontWeight.w500,height: 1.5
                      )
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already registered?',
                       style: TextStyle(
                          color: black,
                        ),),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const LoginPage(title: 'Login Page'),
                            ),
                          );
                        },
                        child: const Text('Sign in Page'),
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
}
