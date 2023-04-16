import 'package:flutter/material.dart';

Image logoWidget(String imageName){
  return Image.asset(imageName,
      fit: BoxFit.fitWidth,
      height: 300,
      width: 300
  );
}

TextField myTextFlied(String text, IconData icon, bool isPasswordType, TextEditingController controller){
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.deepPurple,
    style: TextStyle(color: Colors.cyan.withOpacity(0.9)),

    decoration: InputDecoration(
      prefixIcon: Icon(icon, color: Colors.deepPurple,),
      labelText: text,
      labelStyle: TextStyle(color: Colors.indigo.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none)
      )
    ),

    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,

  );
}