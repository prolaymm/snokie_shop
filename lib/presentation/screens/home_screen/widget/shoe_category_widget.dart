import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:snokie_shoe/domain/vos/brand_vo.dart';
import 'package:snokie_shoe/presentation/reusable_widget/custom_network_image.dart';
import 'package:snokie_shoe/presentation/screens/coming_soon_screen/coming_soon_screen.dart';
import 'package:snokie_shoe/services/api_service/status_type.dart';
import 'package:snokie_shoe/utils/color_constants.dart';
import 'package:snokie_shoe/utils/font_and_margin.dart';
import 'package:snokie_shoe/viewmodel/home_view_model.dart';

class ShoeCategoryWidget extends StatelessWidget {

 final HomeViewModel homeViewModel;
  const ShoeCategoryWidget({super.key, required this.homeViewModel,});

  @override
  Widget build(BuildContext context) {
    return homeViewModel.apiBrandResult.statusType !=StatusType.success? ListView.separated(
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: kDefaultMarginWidth,vertical: kDefaultMarginHeight),
      itemBuilder: (_,index) {

        return SizedBox(
          width: 60,
          height: 100,
          child: Shimmer.fromColors(
            baseColor: Color(0xffe3e3e3),
            highlightColor: Colors.white,
            child: Container(
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: hintColor,
              ),
              height: 100,
            ),
          ),
        );

      }, separatorBuilder: (BuildContext context, int index) => SizedBox(width: 8,),) : ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: kDefaultMarginWidth),
        itemCount: homeViewModel.mBrandList.length,
        itemBuilder: (context,position) {

          BrandVo vo = homeViewModel.mBrandList[position];
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {

          Navigator.push(context, MaterialPageRoute(builder: (_)=> ComingSoonScreen(title:(vo.brandName??"").isEmpty? "Unknow Brand" : vo.brandName)));
        //  homeViewModel.onSelectBrand(position);
        },
        child: AnimatedContainer(
          height: 30,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: //homeViewModel.brandSelectedIndex== position? primaryColor:
            Theme.of(context).shadowColor,
            borderRadius: BorderRadius.circular(8)
          ),
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          child:   SizedBox(height: 24,
          width: 60,
          child: CustomNetworkImage(imageUrl: vo.logo??"",boxFit: BoxFit.contain,radius: 6,),),
        ),
      );
    }, separatorBuilder: (BuildContext context, int index)=> SizedBox(width: kDefaultMarginWidth,),);
  }
}
