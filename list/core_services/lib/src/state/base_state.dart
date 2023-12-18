enum BaseLoadingState {
  initial,
  loading,
  loaded,
  success,
  validationSuccess,
  empty,
  error,
  validationError,
}

abstract class BaseState {
  BaseState({
    required this.loading,
    required this.errorMessage,
  });

  final BaseLoadingState loading;
  final String? errorMessage;
}
