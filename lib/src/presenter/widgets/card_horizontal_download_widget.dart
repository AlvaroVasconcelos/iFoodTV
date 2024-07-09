import 'package:flutter/material.dart';
import 'package:ifoodtv/src/presenter/constants/app_colors.dart';
import 'package:ifoodtv/src/presenter/constants/app_typography.dart';

class CardHorizontalDownloadWidget extends StatelessWidget with AppTypography {
  CardHorizontalDownloadWidget({
    super.key,
    required this.imageUrl,
    required this.onTap,
    required this.title,
    required this.description,
  });

  final String imageUrl;
  final String title;
  final String description;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        imageUrl,
        width: 96,
        height: 54,
      ),
      trailing: const Icon(
        Icons.download,
        color: AppColors.white,
      ),
      title: Text(
        title,
        style: boldCaption1,
      ),
      subtitle: Text(
        description,
        style: lightCaption1,
      ),
    );
  }
}
