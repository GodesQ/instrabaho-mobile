import 'package:flutter/cupertino.dart';

class InstrabahoLogo extends StatelessWidget {
  const InstrabahoLogo({super.key, this.size});
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: Image(
        width: size ?? 100,
        image: const AssetImage('assets/logo.png'),
      ),
    );
  }
}
