import 'package:flutter/material.dart';
import 'package:ifoodtv/src/presenter/constants/app_colors.dart';

class SmallButtonWidget extends StatelessWidget {
  const SmallButtonWidget(
      {super.key, required this.icon, required this.text, required this.onTap});
  final Widget icon;
  final Widget text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        color: AppColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [icon, text],
        ),
      ),
    );
  }
}
