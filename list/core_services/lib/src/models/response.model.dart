class CoreResponse<T> {
  bool success = true;
  String message = "";
  T? data;
  int? errorCode;

  CoreResponse();

  CoreResponse<T> fail(String message) {
    success = false;
    this.message = message;

    return this;
  }
}
