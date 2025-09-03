sealed class Result<T> {
  const Result();
  R when<R>({required R Function(T) ok, required R Function(Failure) err}) {
    final self = this;
    if (self is Ok<T>) return ok(self.value);
    return err((self as Err).failure);
  }
}

class Ok<T> extends Result<T> {
  final T value;
  const Ok(this.value);
}

class Err<T> extends Result<T> {
  final Failure failure;
  const Err(this.failure);
}

class Failure {
  final String code;
  final String message;
  final Object? cause;
  const Failure(this.code, this.message, {this.cause});
}

