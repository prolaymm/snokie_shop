import 'package:http/http.dart';

import 'status_type.dart';

//import 'package:http/http.dart' as http;
class ApiResponse {
  final StatusType statusType;
  final Response? response;
  final String message;

  ApiResponse({required this.statusType, this.response, required this.message});
}

