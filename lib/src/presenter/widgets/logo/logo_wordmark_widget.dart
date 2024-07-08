import 'package:flutter/widgets.dart';

class LogoWordmarkWidget extends StatelessWidget {
  const LogoWordmarkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/logo_wordmark.png",
      width: 86,
      height: 50,
    );
  }
}
