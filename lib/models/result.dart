class Result {
  final int code;
  final String message;
  final dynamic data;

  const Result({
    required this.code,
    required this.message,
    this.data,
  });

  factory Result.fromJSON(Map<String, dynamic> json) {
    return Result(
        code: json['code'] as int,
        message: json['message'] as String,
        data: json['data']);
  }
}
