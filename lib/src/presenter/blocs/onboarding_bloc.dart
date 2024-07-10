import 'package:value_notifier_plus/value_notifier_plus.dart';

abstract class OnboardingPageState {}

class OnboardingPageInitial extends OnboardingPageState {}

class OnboardingPageInProgress extends OnboardingPageState {}

class OnboardingPageSuccess extends OnboardingPageState {}

class OnboardingPageFailure extends OnboardingPageState {}

class OnboardingBloc extends ValueNotifierPlus<OnboardingPageState> {
  OnboardingBloc(super.initialState);
}
