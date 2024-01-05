import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:snokie_shoe/domain/db/shoe_db.dart';
import 'package:snokie_shoe/presentation/reusable_widget/custom_error_widget.dart';
import 'package:snokie_shoe/utils/db_constants.dart';

import '../../../domain/vos/shoe_vo.dart';
import '../../../utils/font_and_margin.dart';
import '../../reusable_widget/shoe_card.dart';
import '../detail_screen/detail_screen.dart';


class SaveScreen extends StatelessWidget {
  const SaveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Wish List"),
          centerTitle: true,
        ),
        body: ValueListenableBuilder(
          valueListenable: ShoeDb()
              .getShoeBox(dbKey: shoeHiveBox)
              .listenable(),
          builder: (context, box, widget) {
            List<ShoeVo> mShoeResultList = box.values.toList();
            return mShoeResultList.isEmpty?  Center(child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Lottie.asset("assets/icon/empty.json",width: 200,height: 200,fit: BoxFit.cover),
                Text("No save data",style: TextStyle(fontSize: 18),)
              ],
            ))
                : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: kDefaultMarginWidth,vertical: kDefaultMarginHeight),
              itemCount: mShoeResultList.length,
              shrinkWrap: true,
              itemBuilder: (_,position) {
                ShoeVo vo = mShoeResultList[position];
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> DetailScreen(shoeVo: vo)));
                  },
                  child: ShoeCard(vo: vo,
                    enableSave: true,
                    onClick:  () => ShoeDb().deleteSingleShoe(
                    dbKey: shoeHiveBox,
                    id: mShoeResultList[position].id),

                  ),
                );

              }, separatorBuilder: (BuildContext context, int index)=> SizedBox(height: 16,),)
            ;
          },
        ));
  }
}