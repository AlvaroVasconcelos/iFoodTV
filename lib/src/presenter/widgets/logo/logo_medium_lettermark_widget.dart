import 'package:flutter/widgets.dart';

class LogoMediumLettermarkWidget extends StatelessWidget {
  const LogoMediumLettermarkWidget({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 14,
      height: 22,
      child: Image.network(imageUrl),
    );
  }
}
