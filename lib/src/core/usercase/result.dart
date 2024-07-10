import 'unit.dart' as type_unit;

/// Base Result class
///
/// Receives two values [F] and [S]
/// as [F] is an error and [S] is a success.
sealed class Result<S extends Object, F extends Object> {
  /// Build a [Result] that returns a [Failure].
  const factory Result.success(S s) = Success;

  /// Build a [Result] that returns a [Failure].
  const factory Result.failure(F e) = Failure;

  /// Returns true if the current result is an [Failure].
  bool isError();

  /// Returns true if the current result is a [Success].
  bool isSuccess();

  /// Returns the result of onSuccess for the encapsulated value
  /// if this instance represents `Success` or the result of onError function
  /// for the encapsulated value if it is `Failure`.
  W match<W>(
    W Function(S success) onSuccess,
    W Function(F failure) onFailure,
  );

  /// Performs the given action on the encapsulated value if this
  /// instance represents success. Returns the original Result unchanged.
  Result<S, F> onSuccess(
    void Function(S success) onSuccess,
  );

  /// Performs the given action on the encapsulated Throwable
  /// exception if this instance represents failure.
  /// Returns the original Result unchanged.
  Result<S, F> onFailure(
    void Function(F failure) onFailure,
  );
}

/// Success Result.
///
/// return it when the result of a [Result] is
/// the expected value.
class Success<S extends Object, F extends Object> implements Result<S, F> {
  /// Receives the [S] param as
  /// the successful result.
  const Success(
    this._success,
  );

  /// Build a `Success` with `Unit` value.
  /// ```dart
  /// Success.unit() == Success(unit)
  /// ```
  static Success<type_unit.Unit, F> unit<F extends Object>() {
    return Success<type_unit.Unit, F>(type_unit.unit);
  }

  final S _success;

  @override
  bool isError() => false;

  @override
  bool isSuccess() => true;

  @override
  int get hashCode => _success.hashCode;

  @override
  bool operator ==(Object other) {
    return other is Success && other._success == _success;
  }

  @override
  W match<W>(
    W Function(S success) onSuccess,
    W Function(F error) onFailure,
  ) {
    return onSuccess(_success);
  }

  @override
  Result<S, F> onFailure(void Function(F failure) onFailure) {
    return this;
  }

  @override
  Result<S, F> onSuccess(void Function(S success) onSuccess) {
    onSuccess(_success);
    return this;
  }
}

/// Error Result.
///
/// return it when the result of a [Result] is
/// not the expected value.
class Failure<S extends Object, F extends Object> implements Result<S, F> {
  /// Receives the [F] param as
  /// the error result.
  const Failure(this._failure);

  /// Build a `Failure` with `Unit` value.
  /// ```dart
  /// Failure.unit() == Failure(unit)
  /// ```
  static Failure<S, type_unit.Unit> unit<S extends Object>() {
    return Failure<S, type_unit.Unit>(type_unit.unit);
  }

  final F _failure;

  @override
  bool isError() => true;

  @override
  bool isSuccess() => false;

  @override
  int get hashCode => _failure.hashCode;

  @override
  bool operator ==(Object other) => //
      other is Failure && other._failure == _failure;

  @override
  W match<W>(
    W Function(S succcess) onSuccess,
    W Function(F failure) onFailure,
  ) {
    return onFailure(_failure);
  }

  @override
  Result<S, F> onFailure(void Function(F failure) onFailure) {
    onFailure(_failure);
    return this;
  }

  @override
  Result<S, F> onSuccess(void Function(S success) onSuccess) {
    return this;
  }
}
