class ErrorResponse {
  String message;
  dynamic errors;

  ErrorResponse(this.message, this.errors);

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        json['message'],
        json['errors'],
      );
}
