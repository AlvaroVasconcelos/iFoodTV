import 'package:value_notifier_plus/value_notifier_plus.dart';

abstract class TrailerState {}

class TrailerInitial extends TrailerState {}

class TrailerLoading extends TrailerState {}

class TrailerLoaded extends TrailerState {}

class TrailerError extends TrailerState {}

class TrailerBloc extends ValueNotifierPlus<TrailerState> {
  TrailerBloc(super.initialState);
}
