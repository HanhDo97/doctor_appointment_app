class UnauthenticatedException implements Exception {
  String message = 'Unauthenticated';

  UnauthenticatedException([this.message = 'Unauthenticated']);

  @override
  String toString() {
    return message;
  }
}
