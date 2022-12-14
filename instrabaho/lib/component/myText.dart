import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({Key? key, required this.text, required this.size, this.type, this.color})
      : super(key: key);
  final String text;
  final double size;
  final String? type;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: type == 'heading'
              ? FontWeight.bold
              : type == 'light'
                  ? FontWeight.w300
                  : FontWeight.normal),
    );
  }
}