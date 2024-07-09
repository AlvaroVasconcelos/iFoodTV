import 'package:flutter/material.dart';

class VerticalButtonWidget extends StatelessWidget {
  const VerticalButtonWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final Widget icon;
  final Widget text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [icon, text],
      ),
    );
  }
}
