import 'package:flutter/widgets.dart';

class LogoLargeLettermarkWidget extends StatelessWidget {
  const LogoLargeLettermarkWidget({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18,
      height: 32,
      child: Image.network(imageUrl),
    );
  }
}
