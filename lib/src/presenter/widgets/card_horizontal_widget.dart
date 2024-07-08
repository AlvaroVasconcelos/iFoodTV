import 'package:flutter/widgets.dart';

class CardHorizontalWidget extends StatelessWidget {
  const CardHorizontalWidget({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 54,
      child: Image.network(imageUrl),
    );
  }
}
