import 'package:flutter/widgets.dart';

class LogoSmallLettermarkWidget extends StatelessWidget {
  const LogoSmallLettermarkWidget({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 8,
      height: 15,
      child: Image.network(imageUrl),
    );
  }
}
