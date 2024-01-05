import 'package:flutter/material.dart';
import 'package:snokie_shoe/domain/vos/brand_vo.dart';

import '../domain/data/impl/shoe_repo_impl.dart';
import '../domain/vos/shoe_vo.dart';
import '../services/api_service/api_result.dart';
import '../services/api_service/status_type.dart';

class HomeViewModel extends ChangeNotifier {

  List<String> shoeCategoryList = ["Addids","Puma"];
  int?  categorySelectedIndex;
  List<ShoeVo> mShoeList = [];
  List<ShoeVo> mShoeResultList = [];
  List<BrandVo> mBrandList = [];
  int? brandSelectedIndex;
  final ApiResult _initState = ApiResult(statusType: StatusType.loading, message: "Loading");
  ApiResult apiShoeResult = ApiResult(statusType: StatusType.loading, message: "Loading");
  ApiResult apiBrandResult = ApiResult(statusType: StatusType.loading, message: "Loading");


  HomeViewModel() {

    init();

  }

  init() {
    getAllBrand();
    getAllShoes();
  }

  Future<void> getAllShoes() async {
    apiShoeResult = _initState;
    ApiResult<List<ShoeVo>?> result = await ShoeRepoIml().getAllShoe();
    if (result.statusType == StatusType.success) {
      mShoeResultList = result.data??[];
    }
    apiShoeResult = result;
    notifyListeners();
  }

  Future<void> getAllBrand() async {
    apiBrandResult = _initState;
    ApiResult<List<BrandVo>?> result = await ShoeRepoIml().getAllBrand();
    if (result.statusType == StatusType.success) {
      mBrandList = result.data??[];
    }
    apiBrandResult = result;
    notifyListeners();
  }


  onSelectBrand(int index) {
    brandSelectedIndex = index;
    notifyListeners();
  }
}

