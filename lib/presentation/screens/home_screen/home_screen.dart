import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:snokie_shoe/domain/vos/shoe_vo.dart';
import 'package:snokie_shoe/presentation/reusable_widget/custom_text_field.dart';
import 'package:snokie_shoe/presentation/reusable_widget/fix_widget.dart';
import 'package:snokie_shoe/presentation/reusable_widget/shoe_card.dart';
import 'package:snokie_shoe/presentation/screens/coming_soon_screen/coming_soon_screen.dart';
import 'package:snokie_shoe/presentation/screens/detail_screen/detail_screen.dart';
import 'package:snokie_shoe/presentation/screens/home_screen/widget/shoe_category_widget.dart';
import 'package:snokie_shoe/services/api_service/status_type.dart';
import 'package:snokie_shoe/utils/color_constants.dart';
import 'package:snokie_shoe/utils/font_and_margin.dart';
import 'package:snokie_shoe/viewmodel/home_view_model.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (_,viewModel,__) {
          return Scaffold(

            appBar: AppBar(
              elevation: 0,
              leading:  GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: ()=> FixWidget().showSnackBar(context: context, title: "Coming Soon"),
                  child: Icon(Icons.menu,size: 34,color: Colors.black,)),
              actions: [
                GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: ()=> FixWidget().showSnackBar(context: context, title: "Coming Soon"),
                    child: SvgPicture.asset("assets/icon/ic_cart.svg",width: 32,height: 32)),
                SizedBox(width: kDefaultMarginWidth,),
              ],
            ),

            body: Column(
              children: [
               GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (_)=> ComingSoonScreen(title: "Search",isBackIcon: true,)));
                 },
                 child: Container(
                   margin: EdgeInsets.symmetric(horizontal: kDefaultMarginWidth,vertical: kDefaultMarginHeight),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(100),
                     color: Colors.white,
                     boxShadow: [
                       BoxShadow(
                         color: Theme.of(context).shadowColor,
                         offset: Offset(2,2),
                         spreadRadius: 4,
                         blurRadius: 4
                       )
                     ]
                   ),
                   child:const  CustomTextField(
                     hint: "Search",
                     isEnable: false,
                     suffixIcon: Icon(Icons.search,size: 28,color: hintColor,),
                   ),
                 ),
               ),
                SizedBox(height: kDefaultMarginHeight,),
                SizedBox(
                    height: 50,
                    child: ShoeCategoryWidget(homeViewModel: viewModel,)),
                SizedBox(height: kDefaultMarginHeight,),

                Expanded(
                  child:viewModel.apiShoeResult.statusType != StatusType.success?RefreshIndicator(
                    onRefresh: () async{
                      viewModel.init();
                    },
                    child: ListView.separated(
                        itemCount: 5,
                        padding: EdgeInsets.symmetric(horizontal: kDefaultMarginWidth,vertical: kDefaultMarginHeight),
                        itemBuilder: (_,index) {

                      return SizedBox(
                        width: 200.0,
                        height: 180.0,
                        child: Shimmer.fromColors(
                          baseColor: Color(0xffe3e3e3),
                          highlightColor: Colors.white,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: hintColor,
                            ),

                            height: 100.0,
                          ),
                        ),
                      );

                    }, separatorBuilder: (BuildContext context, int index) => SizedBox(height: 12,),),
                  ) :  ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultMarginWidth,vertical: kDefaultMarginHeight),
                    itemCount: viewModel.mShoeResultList.length,
                      shrinkWrap: true,
                      itemBuilder: (_,position) {
                      ShoeVo vo = viewModel.mShoeResultList[position];
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> DetailScreen(shoeVo: vo)));
                          },
                          child: ShoeCard(vo: vo,
                            enableSave: false,
                          ),
                        );

                  }, separatorBuilder: (BuildContext context, int index)=> SizedBox(height: 16,),),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
