import 'package:snokie_shoe/domain/vos/brand_vo.dart';
import 'package:snokie_shoe/domain/vos/shoe_vo.dart';

import 'package:snokie_shoe/services/api_service/api_result.dart';

import '../../../services/api_service/api_response.dart';
import '../../../services/api_service/api_service.dart';
import '../../../services/api_service/status_type.dart';
import '../../../utils/api_constants.dart';
import '../shoe_repo.dart';

class ShoeRepoIml extends ShoeRepo {

  static final ShoeRepoIml _singleton = ShoeRepoIml._internal();

  factory ShoeRepoIml() {
    return _singleton;
  }

  ShoeRepoIml._internal();

  final ApiService _apiService = ApiService();

  @override
  Future<ApiResult<List<ShoeVo>?>> getAllShoe()  async{

    ApiResponse response = await _apiService.getApi(endPoint: ApiConstant.shoes);
    if(response.statusType == StatusType.success) {
      return ApiResult(statusType: StatusType.success, message: response.message,
          data: shoeVoFromJson(response.response!.body));
    } else {
      return ApiResult(statusType: StatusType.error, message: response.message,);
    }

  }

  @override
  Future<ApiResult<List<BrandVo>?>> getAllBrand()  async{
    ApiResponse response = await _apiService.getApi(endPoint: ApiConstant.brand);
    if(response.statusType == StatusType.success) {
      return ApiResult(statusType: StatusType.success, message: response.message,
          data: brandVoFromJson(response.response!.body));
    } else {
      return ApiResult(statusType: StatusType.error, message: response.message,);
    }

  }

}