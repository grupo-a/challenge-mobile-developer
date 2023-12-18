class ValidationResultModel<T> {
  T state;
  bool someError;
  ValidationResultModel({
    required this.state,
    required this.someError,
  });
}
