import 'package:value_notifier_plus/value_notifier_plus.dart';

abstract class OnboardingPageState {}

class OnboardingPageInitial extends OnboardingPageState {}

class OnboardingPageLoading extends OnboardingPageState {}

class OnboardingPageLoaded extends OnboardingPageState {}

class OnboardingPageError extends OnboardingPageState {}

class OnboardingBloc extends ValueNotifierPlus<OnboardingPageState> {
  OnboardingBloc(super.initialState);
}
