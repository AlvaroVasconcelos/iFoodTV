import 'package:value_notifier_plus/value_notifier_plus.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {}

class SearchError extends SearchState {}

class SearchBloc extends ValueNotifierPlus<SearchState> {
  SearchBloc(super.initialState);
}
