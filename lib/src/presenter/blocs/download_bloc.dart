import 'package:value_notifier_plus/value_notifier_plus.dart';

abstract class DownloadPageState {}

class DownloadPageInitial extends DownloadPageState {}

class DownloadPageInProgress extends DownloadPageState {}

class DownloadPageSuccess extends DownloadPageState {}

class DownloadPageFailure extends DownloadPageState {}

class DownloadBloc extends ValueNotifierPlus<DownloadPageState> {
  DownloadBloc(super.initialState);
}
