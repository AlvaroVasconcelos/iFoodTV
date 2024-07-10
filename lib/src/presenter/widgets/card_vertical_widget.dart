import 'package:flutter/material.dart';
import 'package:ifoodtv/src/presenter/widgets/transparent_image.dart';

class CardVerticalWidget extends StatelessWidget {
  const CardVerticalWidget({
    super.key,
    required this.imageUrl,
    required this.onTap,
  });
  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: imageUrl.isNotEmpty
          ? Image.network(
              imageUrl,
              width: 106,
              height: 152,
            )
          : Image.memory(
              kTransparentImage,
              width: 106,
              height: 152,
            ),
    );
  }
}
