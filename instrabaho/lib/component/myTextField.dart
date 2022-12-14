import 'package:flutter/material.dart';
import 'package:instrabaho/component/myText.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.myController,
      required this.label,
      this.isPassword,
      this.autofillhints,
      this.suffixIcon,
      this.showPassword,
      this.validator});
  final TextEditingController myController;
  final String label;
  final bool? isPassword;
  final Iterable<String>? autofillhints;
  final IconData? suffixIcon;
  final VoidCallback? showPassword;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      autofillHints: autofillhints,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isPassword == true ? true : false,
      controller: myController,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: showPassword,
            icon: Icon(suffixIcon),
          ),
          border: const OutlineInputBorder(),
          label: MyText(text: label, size: 15)),
    );
  }
}
