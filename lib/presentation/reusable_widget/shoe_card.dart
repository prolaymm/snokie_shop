import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:snokie_shoe/domain/vos/shoe_vo.dart';
import 'package:snokie_shoe/presentation/reusable_widget/custom_network_image.dart';
import 'package:snokie_shoe/presentation/reusable_widget/fix_widget.dart';
import 'package:snokie_shoe/utils/color_constants.dart';

class ShoeCard extends StatelessWidget {


 final ShoeVo vo;
 final bool enableSave;
 final VoidCallback? onClick;
  const ShoeCard({super.key, required this.vo, this.enableSave = false, this.onClick});

  @override
  Widget build(BuildContext context) {
    return  Container(

      height: 260,
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).shadowColor,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Expanded(
            child: Stack(
              children: [

                Container(
                    height: 160,
                    padding: EdgeInsets.only(top: 12),
                    width: double.infinity,
                    child: CustomNetworkImage(imageUrl: vo.image?.thumbnail??"",boxFit: BoxFit.cover,height: 120,)),
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$${vo.retailPrice??"0"}",style: Theme.of(context).textTheme.titleLarge,),
                    if(enableSave)     GestureDetector(
                        onTap: onClick,
                        behavior: HitTestBehavior.opaque,
                        child: Icon(Icons.favorite,color: primaryColor,size: 32,))
                  ],
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

            Expanded(child: Text(vo.name??"",style: Theme.of(context).textTheme.titleMedium,maxLines: 2,overflow: TextOverflow.ellipsis,)),

            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {

                FixWidget().showSnackBar(context: context, title: "Added to cart");
              },
              child: Container(
                height:30,
                padding: EdgeInsets.all(6),
                decoration:const  BoxDecoration(
                    color: textColor,
                  shape: BoxShape.circle
                ),

                child: Icon(Icons.shopping_basket_outlined,size: 20,color: Colors.white,),
              ),
            )
          ],)



        ],
      )
    );
  }
}
