import 'package:flutter/material.dart';
import 'package:snokie_shoe/domain/vos/brand_vo.dart';
import 'package:snokie_shoe/presentation/reusable_widget/custom_network_image.dart';
import 'package:snokie_shoe/utils/color_constants.dart';
import 'package:snokie_shoe/utils/font_and_margin.dart';
import 'package:snokie_shoe/viewmodel/detail_view_model.dart';
import 'package:snokie_shoe/viewmodel/home_view_model.dart';

class ShoeSizeWidget extends StatelessWidget {

  final DetailViewModel detailViewModel;
  const ShoeSizeWidget({super.key, required this.detailViewModel,});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
     // padding: EdgeInsets.symmetric(horizontal: kDefaultMarginWidth),
      itemCount: detailViewModel.vo.size!.length,
      itemBuilder: (context,position) {
        int value  = detailViewModel.vo.size![position];
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            detailViewModel.onSelectSize(position);
          },
          child: AnimatedContainer(
            height: 25,
            width: 70,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: detailViewModel.selectedSize== position? primaryColor:   Theme.of(context).shadowColor,
                borderRadius: BorderRadius.circular(8)
            ),
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            child:   Center(child: Text("$value",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: detailViewModel.selectedSize== position?whiteColor : textColor),)),
          ),
        );
      }, separatorBuilder: (BuildContext context, int index)=> SizedBox(width: 8,),);
  }
}
