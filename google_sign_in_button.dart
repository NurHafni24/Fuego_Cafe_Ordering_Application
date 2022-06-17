import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fuego_cafe/screens/user_info_screen.dart';
import 'package:fuego_cafe/utils/authentication.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? Container(
              height: 80,
              width: 100,
              padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ))
          : Container(
              height: 80,
              width: double.infinity,
              padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Sign Using Google',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.lightBlue,
                  ),
                ),
                onPressed: () async {
                  setState(() {
                    _isSigningIn = true;
                  });
                  User? user =
                      await Authentication.signInWithGoogle(context: context);

                  setState(() {
                    _isSigningIn = false;
                  });

                  if (user != null) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => UserInfoScreen(user: user),
                      ),
                    );
                  }
                },
              ),
            ),
    );
  }
}
