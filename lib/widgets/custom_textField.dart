import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLines;
  final bool obscureText;
  final String hintText;
  const CustomTextField({super.key, 
   required this.controller,
   this.obscureText = false,
   required this.hintText, 
    this.maxLines =1 });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38)
        )
      ),
      validator: ((value) {
        if(value == null || value.isEmpty){
         return 'Enter your $hintText';
        }
        return null;
      }),
      maxLines:  maxLines,
    );
  }
}