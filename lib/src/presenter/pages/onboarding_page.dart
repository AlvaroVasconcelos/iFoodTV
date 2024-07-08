import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_colors.dart';
import '../constants/app_typography.dart';
import '../widgets/button/onboard_button_widget.dart';
import '../widgets/carrousel_widget.dart';
import '../widgets/logo/logo_wordmark_widget.dart';

class OnboardingPage extends StatelessWidget with AppTypography {
  OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: AppColors.black,
        child: Column(
          children: [
            Row(
              children: [
                const LogoWordmarkWidget(),
                const Spacer(),
                Text(
                  "Privacy",
                  style: boldLabel2.copyWith(color: AppColors.white),
                ),
                const SizedBox(width: 20),
                Text(
                  "Sign in",
                  style: boldLabel2.copyWith(color: AppColors.white),
                ),
                const SizedBox(width: 20),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                CarrouselWidget(
                  pages: [
                    Container(
                      color: AppColors.black,
                    ),
                    Container(
                      color: AppColors.grey,
                    ),
                    Container(
                      color: AppColors.red,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Unlimited movies, TV shows, and more.',
                        style: boldHeader1.copyWith(color: AppColors.white),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Watch anywhere. Cancel anytime. Tap the link below to sign up.',
                        style: boldLabel1.copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            OnboardButtonWidget(
              onTap: () {
                context.go('/home');
              },
            ),
          ],
        ),
      ),
    );
  }
}
