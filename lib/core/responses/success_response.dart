class SuccessResponse {
  String status;
  String message;
  dynamic data;

  SuccessResponse(this.status, this.message, this.data);

  factory SuccessResponse.fromJson(Map<String, dynamic> json) =>
      SuccessResponse(
        json['status'],
        json['message'],
        json['data'],
      );
}
