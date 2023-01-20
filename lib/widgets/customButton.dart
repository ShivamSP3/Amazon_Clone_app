import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text ;
  final VoidCallback onTap;
  final Color? color;
  const CustomButton({super.key,this.color,
   required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,width: double.infinity,
        child: ElevatedButton(
          child: Text(text,
          style: TextStyle(color: color == null ? Colors.white : Colors.black),
          ),
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            primary: color,
            maximumSize: const Size(double.infinity,50)
          ),
        
      ),
    );
  }
}