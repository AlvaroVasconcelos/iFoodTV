import 'package:flutter/material.dart';

class UserButtonWidget extends StatelessWidget {
  const UserButtonWidget({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/user.png",
      height: 24,
      width: 24,
    );
  }
}
