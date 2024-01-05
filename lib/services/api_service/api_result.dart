
import 'status_type.dart';

class ApiResult <T> {

  final StatusType statusType;
  late final T? data;
  final String message;
  ApiResult({required this.statusType, this.data,required this.message});
}
