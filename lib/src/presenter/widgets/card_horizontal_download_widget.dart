import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_typography.dart';
import 'transparent_image.dart';

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
      leading: imageUrl.isNotEmpty
          ? Image.asset(
              imageUrl,
              width: 96,
              height: 54,
            )
          : Image.memory(
              kTransparentImage,
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
