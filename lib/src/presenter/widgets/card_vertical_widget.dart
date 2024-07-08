import 'package:flutter/widgets.dart';

class CardVerticalWidget extends StatelessWidget {
  const CardVerticalWidget({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 106,
      height: 152,
      child: Image.network(imageUrl),
    );
  }
}
