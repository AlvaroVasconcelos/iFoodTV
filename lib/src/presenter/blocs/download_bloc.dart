import 'package:value_notifier_plus/value_notifier_plus.dart';

abstract class DownloadPageState {}

class DownloadPageInitial extends DownloadPageState {}

class DownloadPageLoading extends DownloadPageState {}

class DownloadPageLoaded extends DownloadPageState {}

class DownloadPageError extends DownloadPageState {}

class DownloadBloc extends ValueNotifierPlus<DownloadPageState> {
  DownloadBloc(super.initialState);
}
