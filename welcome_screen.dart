import 'package:flutter/material.dart';
import 'package:fuego_cafe/guest_page.dart';
import 'package:fuego_cafe/res/custom_colors.dart';
import 'package:fuego_cafe/screens/user_info_screen.dart';
import 'package:fuego_cafe/utils/authentication.dart';
import 'package:fuego_cafe/widgets/google_sign_in_button.dart';
// import 'login_screen.dart';
// import 'signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome-screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  /*
  Widget routeButton(Color buttonColor, String title, Color textColor, BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: buttonColor,
        onPressed: () => context,
        child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: textColor,),),
      ),
    );
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1557683316-973673baf926?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE4fHx8ZW58MHx8fHw%3D&w=1000&q=80'),
                  fit: BoxFit.fill),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, left: 25),
                  child: Column(
                    children: const [
                      Center(
                        child: Text(
                          'Handle your order with',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        'Fuego Cafe\'',
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      padding:
                          const EdgeInsets.only(top: 25, left: 24, right: 24),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.indigo,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GuestPage(),
                            ),
                          )
                        },
                        child: const Text(
                          'Log In as Guest',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    FutureBuilder(
                      future:
                          Authentication.initializeFirebase(context: context),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          return const GoogleSignInButton();
                        }
                        return const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            CustomColors.firebaseOrange,
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


  // FutureBuilder(
  //               future: Authentication.initializeFirebase(context: context),
  //               builder: (context, snapshot) {
  //                 if (snapshot.hasError) {
  //                   return Text(snapshot.error.toString());
  //                 } else if (snapshot.connectionState == ConnectionState.done) {
  //                   return const GoogleSignInButton();
  //                 }
  //                 return const CircularProgressIndicator(
  //                   valueColor: AlwaysStoppedAnimation<Color>(
  //                     CustomColors.firebaseOrange,
  //                   ),
  //                 );
  //               },
  //             )