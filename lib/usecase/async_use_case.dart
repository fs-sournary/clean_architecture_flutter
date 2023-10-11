/// The base class handles tasks asynchronously.
///
/// It takes two types:
/// - [P] The type of parameter.
/// - [R] The type of result.
abstract class AsyncUseCase<P, R> {
  const AsyncUseCase();

  Future<R> call(P params);
}
