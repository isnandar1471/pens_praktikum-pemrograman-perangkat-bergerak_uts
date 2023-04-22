class ErrorresponseModel {
  ErrorresponseModel({
    required this.response,
    required this.error,
  });

  String response;
  String error;

  factory ErrorresponseModel.fromJson(Map<String, dynamic> json) =>
      ErrorresponseModel(
        response: json["Response"],
        error: json["Error"],
      );

  Map<String, dynamic> toJson() => {
        "Response": response,
        "Error": error,
      };
}
