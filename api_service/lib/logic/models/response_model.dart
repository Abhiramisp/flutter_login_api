class ResponseModel {
  ResponseModel({
    required this.success,
    required this.reason,
  });

  bool success;
  var reason;

  static ResponseModel fromJson(Map<String, dynamic> json) => ResponseModel(
        success: json["success"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "reason": reason,
      };
}
