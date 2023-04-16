import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_firebase/utils/my_routes.dart';
import 'package:learning_firebase/utils/reusable%20widgets/reusable_widgets.dart';

import '../utils/color_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        iconTheme: IconThemeData(color: Colors.black87, size:25),

        title: const Text("Sign Up",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),),


      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [hexStringToColors("f5e1c3"),
                hexStringToColors("f4d5f6"),
                hexStringToColors("a3cbf7")
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,

            )
        ),

        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.1, 20, 0),

            child: Column(
              children: <Widget>[

                myTextFlied("Enter Username", Icons.person_2_outlined, false, _usernameController),
                SizedBox(height: 20,),

                myTextFlied("Enter Email Address", Icons.email_outlined, false, _emailController),
                SizedBox(height: 20,),

                myTextFlied("Enter Password", Icons.lock_outline, true, _passwordController),
                SizedBox(height: 20,),

                ElevatedButton(
                  onPressed: (){
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text).then((value) {
                          print("Created New Account:");
                          Navigator.pushNamed(context, MyRoutes.home);
                    }).onError((error, stackTrace) {
                      print("Error: ${error.toString()}");
                    });

                  },
                  child: const Text("Sign Up", ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)){
                            return Colors.purple;
                          }
                          return Colors.deepPurple;
                        })
                    ),
                ),

              ],
            ),
          ),

        ),

      ),

    );
  }
}
