import 'package:flutter/material.dart';
import 'package:ifoodtv/src/presenter/widgets/transparent_image.dart';

import '../constants/app_typography.dart';

class CardHorizontalWidget extends StatelessWidget with AppTypography {
  CardHorizontalWidget({
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
          ? Image.network(
              imageUrl,
              width: 96,
              height: 54,
            )
          : Image.memory(
              kTransparentImage,
              width: 96,
              height: 54,
            ),
      title: Text(
        title,
        style: boldCaption1,
      ),
      subtitle: Text(
        description,
        style: lightCaption1,
        maxLines: 3,
      ),
    );
  }
}
