import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fuego_cafe/firebase_options.dart';
import 'package:fuego_cafe/main_menu.dart';
import 'login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

ColorScheme defaultColorScheme = const ColorScheme(
  primary: Color.fromARGB(255, 56, 50, 247),
  secondary: Color(0xff03DAC6),
  surface: Color(0xff181818),
  background: Color(0xFFEEEEEE),
  error: Color(0xffCF6679),
  onPrimary: Color(0xff000000),
  onSecondary: Color(0xff000000),
  onSurface: Color.fromARGB(255, 0, 0, 0),
  onBackground: Color(0xffffffff),
  onError: Color(0xff000000),
  brightness: Brightness.dark,
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width; //Come from dart:ui class

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        colorScheme: defaultColorScheme,
        primarySwatch: Colors.blue,
      ),
      // home: const LoginPage(title: 'Login Page'), //call login_screen.dart
            home: Menu(), //call login_screen.dart


    //   home: StreamBuilder <User?>(
    //     stream: FirebaseAuth.instance.authStateChanges(),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData){
    //         //put retun page TINI (Menu)
    //        return const LoginPage(title:'yuhuuuuuu');
    //       } 
    //       else {
    //        return const LoginPage(title:'Login Page');
    //       }
    //     }
    // )
    );
  }
}
