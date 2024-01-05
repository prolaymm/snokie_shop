import 'package:hive_flutter/hive_flutter.dart';
import 'package:snokie_shoe/domain/vos/shoe_vo.dart';

import '../utils/db_constants.dart';


class HiveHelper {

  HiveHelper() {
    _registerHiveBox();
  }

  _registerHiveBox() {
    Hive.registerAdapter(ShoeVoAdapter());
    Hive.registerAdapter(ImageAdapter());
    Hive.registerAdapter(LinksAdapter());



  }

  Future openHiveBox() async{
    await Future.wait(([
      Hive.openBox<ShoeVo>(shoeHiveBox),

    ]));
  }
}