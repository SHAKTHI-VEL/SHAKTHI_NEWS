
class ResponseModel{
  final bool success;
  final String message;
  final List<dynamic> data;

  ResponseModel({required this.success, required this.message, required this.data});
}