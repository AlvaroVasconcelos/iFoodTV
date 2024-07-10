import 'result.dart';

abstract class Usercase<Params> {
  Future<Result> execute(Params params);
}
