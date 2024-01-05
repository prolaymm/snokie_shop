import 'package:snokie_shoe/domain/vos/brand_vo.dart';
import 'package:snokie_shoe/domain/vos/shoe_vo.dart';

import '../../services/api_service/api_result.dart';

abstract class ShoeRepo {

  Future<ApiResult<List<ShoeVo>?>> getAllShoe();
  Future<ApiResult<List<BrandVo>?>> getAllBrand();
}