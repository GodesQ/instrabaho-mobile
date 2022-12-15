import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:instrabaho/component/logo.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          InstrabahoLogo(
            size: 120,
          ),
          SizedBox(
            height: 30,
          ),
          SpinKitCircle(
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
