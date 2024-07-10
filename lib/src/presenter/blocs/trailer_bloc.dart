import 'package:value_notifier_plus/value_notifier_plus.dart';

abstract class TrailerState {}

class TrailerInitial extends TrailerState {}

class TrailerInProgress extends TrailerState {}

class TrailerSuccess extends TrailerState {}

class TrailerFailure extends TrailerState {}

class TrailerBloc extends ValueNotifierPlus<TrailerState> {
  TrailerBloc(super.initialState);
}
