import 'package:flutter/widgets.dart';

class LogoLargeLettermarkWidget extends StatelessWidget {
  const LogoLargeLettermarkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/icon_ifood.png",
      width: 50,
      height: 32,
    );
  }
}
