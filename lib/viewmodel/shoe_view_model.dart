import 'dart:core';
import 'dart:core';
import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:snokie_shoe/services/api_service/status_type.dart';

import '../domain/data/impl/shoe_repo_impl.dart';
import '../domain/vos/shoe_vo.dart';
import '../services/api_service/api_result.dart';

class ShoeViewModel extends ChangeNotifier {
  ShoeViewModel() {

  }

  List<ShoeVo> mShopList = [];
  final ApiResult _initState =
      ApiResult(statusType: StatusType.loading, message: "Loading");
  ApiResult apiShoeResult =
      ApiResult(statusType: StatusType.loading, message: "Loading");

  Future<void> getAllShoes() async {
    apiShoeResult = _initState;
    ApiResult<List<ShoeVo>?> result = await ShoeRepoIml().getAllShoe();
    if (result.statusType == StatusType.success) {
      mShopList = result.data??[];
    }
    apiShoeResult = result;
    notifyListeners();
  }
}
