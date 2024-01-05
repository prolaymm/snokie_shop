import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:snokie_shoe/services/api_service/status_type.dart';

import '../../utils/api_constants.dart';
import 'api_response.dart';

class ApiService {
  static final ApiService _singleton = ApiService._internal();

  factory ApiService() {
    return _singleton;
  }

  ApiService._internal();

  String baseUrl = ApiConstant.baseUrl;


  Future<ApiResponse> getApi({Map? body, required String endPoint}) async {
    try {
      http.Response response = await http.get(Uri.parse(baseUrl + endPoint),headers: {"Accept" : "application/json"});
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse(
            statusType: StatusType.success,
            message: "Success",
            response: response);
      } else if (response.statusCode >= 500) {
        return ApiResponse(
            statusType: StatusType.success,
            message: "Something Gone Wrong With Server");
      } else if (response.statusCode == 404) {
        return ApiResponse(
            statusType: StatusType.success, message: "404 Not Found");
      } else {
        return ApiResponse(
            statusType: StatusType.error,
            message: response.body,
            response: response);
      }
    } on SocketException {
      return ApiResponse(
          statusType: StatusType.error, message: "No Internet Connection");
    } catch (error) {
      return ApiResponse(
          statusType: StatusType.error, message: "Something gone wrong");
    }
  }

  Future<ApiResponse> postApi({Map? body, required String endPoint,bool? isEncodeJson}) async {
    try {
      http.Response response =
          await http.post(Uri.parse(baseUrl + endPoint), body: isEncodeJson== true? jsonEncode(body) : body,headers: {"Accept" : "application/json"});

 //     print("reponse ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse(
            statusType: StatusType.success,
            message: "Success",
            response: response);
      } else {
        return ApiResponse(
            statusType: StatusType.error,
            message: response.body,
            response: response);
      }
    } on SocketException {
      return ApiResponse(
          statusType: StatusType.error, message: "No Internet Connection");
    } catch (error) {

      return ApiResponse(
          statusType: StatusType.error, message: error.toString());
    }
  }



}
