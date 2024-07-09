import 'package:flutter/widgets.dart';

class LogoSmallLettermarkWidget extends StatelessWidget {
  const LogoSmallLettermarkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.network(
        "assets/icon_ifood.png",
        width: 8,
        height: 15,
      ),
    );
  }
}
