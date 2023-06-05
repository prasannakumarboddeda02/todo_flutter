import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final String text;
  final VoidCallback? onPressed;
  const Button({super.key,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black
        ),));
  }
}