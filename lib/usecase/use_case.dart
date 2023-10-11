/// The base class handles tasks synchronously.
///
/// It takes two types:
/// - [P] The type of parameter.
/// - [R] The type of result.
abstract class UseCase<P, R> {
  const UseCase();

  R call(P params);
}
