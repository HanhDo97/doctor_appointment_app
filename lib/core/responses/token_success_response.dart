class TokenSuccessResponse {
  String status;
  String message;
  String token;

  TokenSuccessResponse(this.status, this.message, this.token);

  factory TokenSuccessResponse.fromJson(Map<String, dynamic> json) =>
      TokenSuccessResponse(
        json['status'],
        json['message'],
        json['token'],
      );
}
