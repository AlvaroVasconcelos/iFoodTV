import 'package:value_notifier_plus/value_notifier_plus.dart';

abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {}

class HomePageError extends HomePageState {}

class HomeBloc extends ValueNotifierPlus<HomePageState> {
  HomeBloc(super.initialState);
}
