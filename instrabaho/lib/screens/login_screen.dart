import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instrabaho/bloc/auth_toggle/auth_toggle_bloc.dart';
import 'package:instrabaho/component/myButton.dart';
import 'package:instrabaho/component/myText.dart';
import 'package:instrabaho/component/myTextField.dart';
import 'package:instrabaho/component/snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController _emailAddressController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
final _formKey = GlobalKey<FormState>();
bool obscureText = true;
String selectedUserType = 'freelancer';

class _LoginScreenState extends State<LoginScreen> {
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
                  ),
                ),
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
                            text: 'Sign in to Instrabaho',
                            size: 18,
                            type: 'heading',
                            color: Colors.black87,
                          ),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<AuthToggleBloc>(context)
                                  .add(SwitchToRegisterEvent());
                            },
                            child: Row(
                              children: const [
                                MyText(text: "Dont have an account?", size: 13),
                                SizedBox(
                                  width: 5,
                                ),
                                MyText(
                                  text: 'Register here',
                                  size: 13,
                                  color: Colors.blueAccent,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const MyText(
                            text: 'Are you?',
                            size: 16,
                            type: 'heading',
                            color: Colors.black87,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Flexible(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            width: .5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: RadioListTile(
                                        contentPadding: const EdgeInsets.all(2),
                                        value: 'freelancer',
                                        groupValue: selectedUserType,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedUserType = value!;
                                          });
                                        },
                                        title: const MyText(
                                            text: 'Freelancer', size: 15),
                                      ))),
                              const SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            width: .5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: RadioListTile(
                                        value: 'employer',
                                        groupValue: selectedUserType,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedUserType = value!;
                                          });
                                        },
                                        title: const MyText(
                                            text: 'Employer', size: 15),
                                      )))
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MyTextField(
                            myController: _emailAddressController,
                            label: 'Email address',
                            autofillhints: const [AutofillHints.email],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Do not leave it blank*';
                              } else if (!value.contains('@')) {
                                return 'Please make sure your email address is in a correct format';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MyTextField(
                            myController: _passwordController,
                            label: 'Password',
                            isPassword: obscureText,
                            validator: (password) {
                              if (password!.isEmpty) {
                                return 'Please input your password';
                              } else if (password.length <= 5) {
                                return 'Password is too short';
                              }
                              return null;
                            },
                            suffixIcon: obscureText
                                ? CupertinoIcons.eye
                                : CupertinoIcons.eye_fill,
                            showPassword: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              MyText(
                                text: 'Forgot password?',
                                size: 14,
                                color: Colors.blueAccent,
                              )
                            ],
                          ),
                          MyButton(
                            text: 'Login Account',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                _emailAddressController.text = '';
                                _passwordController.text = '';
                                MySnackBar.buildSuccessfulSnackbar(
                                    context, 'Login Successfully');
                                BlocProvider.of<AuthToggleBloc>(context)
                                    .add(SwitchToHomeEvent(selectedUserType));
                              }
                            },
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
