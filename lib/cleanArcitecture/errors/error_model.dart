class ErrorModel {
  final int statues;
  final String errorMessage;
  ErrorModel({required this.statues, required this.errorMessage});
  factory ErrorModel.fromjson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      errorMessage: jsonData["Message"],
      statues: jsonData["status"],
    );
  }
}
