import 'package:flutter/material.dart';
import 'package:ifoodtv/src/presenter/constants/app_colors.dart';
import 'package:ifoodtv/src/presenter/constants/app_typography.dart';

class TextButtonWidget extends StatelessWidget with AppTypography {
  TextButtonWidget({super.key, required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        label,
        style: boldLabel3.copyWith(color: AppColors.white),
      ),
    );
  }
}
