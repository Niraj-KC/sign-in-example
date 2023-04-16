import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_firebase/utils/my_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            ElevatedButton(onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.pushNamed(context, MyRoutes.signIn);
                print("Signed Out");
              });
            }, child: Text("Sign Out"))
          ],
        ),
      ),
    );
  }
}
