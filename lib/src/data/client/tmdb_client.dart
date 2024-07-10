import 'package:tmdb_api/tmdb_api.dart';

class TmdbClient extends TMDB {
  TmdbClient(super.apiKeys, {super.logConfig = const ConfigLogger.showAll()});
}
