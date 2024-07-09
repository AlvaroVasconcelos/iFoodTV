import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ifoodtv/src/presenter/constants/app_typography.dart';

import '../constants/app_colors.dart';

class BasePage extends StatelessWidget with AppTypography {
  BasePage({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.black,
          fixedColor: AppColors.grey,
          unselectedLabelStyle: boldCaption2,
          currentIndex: navigationShell.currentIndex,
          onTap: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: AppColors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: AppColors.grey,
              ),
              label: 'Seach',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.download,
                color: AppColors.grey,
              ),
              label: 'Downloads',
            ),
          ],
        ),
        backgroundColor: AppColors.black,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: navigationShell,
        ),
      ),
    );
  }
}
