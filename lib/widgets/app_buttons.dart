import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final double minSize;
  final Function()? onPressed;
   AppButton({super.key, required this.backgroundColor, required this.textColor, required this.text, required this.minSize, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onPressed,
      minWidth: minSize,
      
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4))
      ),
      textColor: textColor,
      color: backgroundColor,
      child: Text(text)
    );
  }
}