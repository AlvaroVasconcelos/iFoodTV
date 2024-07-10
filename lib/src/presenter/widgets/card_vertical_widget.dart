import 'package:flutter/material.dart';

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
      child: Image.network(
        imageUrl,
        width: 106,
        height: 152,
      ),
    );
  }
}
