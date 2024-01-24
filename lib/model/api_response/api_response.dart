class ApiResponse {
  bool result;
  String? message;
  dynamic successContents;

  ApiResponse({
    this.result = false,
    this.message,
    this.successContents,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      result: json['result'],
      message: json['message'],
      successContents: json['successContent'],
    );
  }
}
