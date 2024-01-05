import 'package:hive/hive.dart';

import '../vos/shoe_vo.dart';

class ShoeDb {

  static final ShoeDb _singleton = ShoeDb._internal();

  ShoeDb._internal();
  factory ShoeDb() {
    return _singleton;
  }

  Future<void> saveShoe({required List<ShoeVo> vo,required String dbKey}) async {

    for(ShoeVo shoeVo in vo) {
      getShoeBox(dbKey: dbKey).put(shoeVo.id,shoeVo);
    }
  }
  Future<void> saveSingleShoe({required ShoeVo vo,required String dbKey}) async {
    getShoeBox(dbKey: dbKey).put(vo.id,vo);

  }

  bool checkContainShoe({required String dbKey,required String id}) {

    ShoeVo shoeVo =  getShoeBox(dbKey: dbKey).get(id)??ShoeVo();
    if(shoeVo.id != null) {
      return true;
    }else {
      return false;
    }
  }

  List<ShoeVo> getAllShoe({required String dbKey}) {
    return getShoeBox(dbKey: dbKey).values.toList().isEmpty
        ? []
        : getShoeBox(dbKey: dbKey).values.toList();
  }
  ShoeVo getSingleShoe({required String dbKey,required String id}) {
    return getShoeBox(dbKey: dbKey).get(id)??ShoeVo();

  }

  Future deleteSingleShoe({required String dbKey,required id}) {
    return getShoeBox(dbKey: dbKey).delete(id);
  }

  Future deleteAllShoe({required String dbKey}) {
    return getShoeBox(dbKey: dbKey).deleteAll(getShoeBox(dbKey: dbKey).keys);
  }

  Box<ShoeVo> getShoeBox({required String dbKey}) {
    return Hive.box<ShoeVo>(dbKey);
  }
}