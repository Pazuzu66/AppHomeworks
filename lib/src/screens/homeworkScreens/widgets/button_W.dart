import 'package:flutter/material.dart';
class ButtonW extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final Color textColor;
  
  ButtonW({
    required this.onPressed,
    required this.text,
    required this.color,
    required this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor:  MaterialStateProperty.all<Color>(this.color),
          foregroundColor:  MaterialStateProperty.all<Color>(this.textColor),
        ) ,
        onPressed:()=> this.onPressed(), 
        child: Text(this.text,)
        ),
    );
  }
}