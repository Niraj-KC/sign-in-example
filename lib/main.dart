import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learning_firebase/screens/home_screen.dart';
import 'package:learning_firebase/screens/sign_in_screen.dart';
import 'package:learning_firebase/screens/sign_up_screen.dart';
import 'package:learning_firebase/utils/my_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: {
        "/": (context) => SignInScreen(),
        MyRoutes.home: (context) => HomeScreen(),
        MyRoutes.signIn: (context) => SignInScreen(),
        MyRoutes.signUp: (context) => SignUpScreen(),
      },


    );
  }
}
