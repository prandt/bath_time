

import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({super.key, required this.text, required this.onPressed});
  String text;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Text(
        text,
      )
    );
  }

}