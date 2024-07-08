import 'package:flutter/widgets.dart';

class CarrouselWidget extends StatelessWidget {
  const CarrouselWidget({super.key, required this.pages});
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: PageView(
        allowImplicitScrolling: true,
        children: pages,
      ),
    );
  }
}
