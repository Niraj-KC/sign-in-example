import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_firebase/utils/color_utils.dart';
import 'package:learning_firebase/utils/my_routes.dart';
import 'package:learning_firebase/utils/reusable widgets/reusable_widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                logoWidget("assets/images/sign_in_page_img.png"),

                SizedBox(height: 10,),

                myTextFlied("Enter Username", Icons.person_outlined, false, _emailTextController),

                SizedBox(height: 20,),

                myTextFlied("Enter Password", Icons.lock_outline, true, _passwordTextController),

                SizedBox(height: 20,),

                ElevatedButton(
                  onPressed: (){
                    FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text).
                    then((value) {
                          Navigator.pushNamed(context, MyRoutes.home);
                    }).
                    onError((error, stackTrace){
                      print("Error: ${error.toString()}");
                    });

                  },
                  child: const Text("Sign In", ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)){
                          return Colors.purple;
                        }
                        return Colors.deepPurple;
                      })
                  ),
                ),

                SizedBox(height: 10,),

                signUpOption()




              ],
            ),
          ),

        ),

      ),
    );
  }

  Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      // ignore: prefer_const_literals_to_create_immutables
      children:  [
        const Text(
          "Don't have account?",
          style: TextStyle(color: Colors.black54),),

        SizedBox(width: 5,),

        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, MyRoutes.signUp);
          },

          child: const Text("Sign Up",
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18)),
        )


      ],
    );
  }


}
