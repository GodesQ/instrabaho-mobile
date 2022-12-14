import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.text,
      this.onTap,
      this.backgroundColor,
      this.radius});
  final String text;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 0),
          )),
      onPressed: onTap,
      child: Text(text),
    );
  }
}
