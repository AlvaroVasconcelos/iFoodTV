import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_typography.dart';

class OnboardButtonWidget extends StatelessWidget with AppTypography {
  OnboardButtonWidget({super.key, required this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: AppColors.red,
        width: 356,
        height: 44,
        child: Center(
          child: Text(
            'Get Started',
            style: boldLabel2,
          ),
        ),
      ),
    );
  }
}
