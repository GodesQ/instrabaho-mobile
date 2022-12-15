import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instrabaho/bloc/auth_toggle/auth_toggle_bloc.dart';
import 'package:instrabaho/component/myButton.dart';
import 'package:instrabaho/component/snackbar.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyButton(
        text: 'Logout',
        onTap: () {
          BlocProvider.of<AuthToggleBloc>(context).add(SwitchToLoginEvent());
          MySnackBar.buildSuccessfulSnackbar(context, 'Sign out successful');
        },
      ),
    );
  }
}
