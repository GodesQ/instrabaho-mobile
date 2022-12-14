import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instrabaho/bloc/auth_toggle/auth_toggle_bloc.dart';
import 'package:instrabaho/component/myButton.dart';
import 'package:instrabaho/component/myText.dart';
import 'package:instrabaho/component/myTextField.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

TextEditingController _firstNameController = TextEditingController();
TextEditingController _middleNameController = TextEditingController();
TextEditingController _lastNameController = TextEditingController();
TextEditingController _userNameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _confirmPasswordController = TextEditingController();
final _formKey = GlobalKey<FormState>();
bool obscureText = true;
bool obscureText2 = true;

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Hero(
                    tag: 'logo',
                    child: Image(
                      image: AssetImage('assets/logo.png'),
                      width: 120,
                    )),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const MyText(
                            text: 'Create your Instrabaho Account',
                            size: 18,
                            type: 'heading',
                            color: Colors.black87,
                          ),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<AuthToggleBloc>(context)
                                  .add(SwitchToLoginEvent());
                            },
                            child: Row(
                              children: const [
                                MyText(
                                    text: "Have an account already?", size: 13),
                                SizedBox(
                                  width: 5,
                                ),
                                MyText(
                                  text: 'Login here',
                                  size: 13,
                                  color: Colors.blueAccent,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          MyTextField(
                            myController: _firstNameController,
                            label: 'First name',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Flexible(
                                  child: MyTextField(
                                myController: _middleNameController,
                                label: 'Middle name',
                              )),
                              const SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                  child: MyTextField(
                                myController: _lastNameController,
                                label: 'Middle name',
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MyTextField(
                            myController: _userNameController,
                            label: 'Username',
                            autofillhints: const [AutofillHints.name],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MyTextField(
                            myController: _emailController,
                            label: 'Email address',
                            autofillhints: const [AutofillHints.email],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Flexible(
                                  child: MyTextField(
                                myController: _passwordController,
                                label: 'Set password',
                                isPassword: obscureText,
                                suffixIcon: obscureText
                                    ? CupertinoIcons.eye
                                    : CupertinoIcons.eye_fill,
                                showPassword: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                              )),
                              const SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                  child: MyTextField(
                                myController: _confirmPasswordController,
                                label: 'Confirm password',
                                isPassword: obscureText2,
                                suffixIcon: obscureText2
                                    ? CupertinoIcons.eye
                                    : CupertinoIcons.eye_fill,
                                showPassword: () {
                                  setState(() {
                                    obscureText2 = !obscureText2;
                                  });
                                },
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MyButton(
                            text: 'Create Account',
                            onTap: () {},
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
