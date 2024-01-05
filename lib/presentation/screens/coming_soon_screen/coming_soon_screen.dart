import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:snokie_shoe/utils/color_constants.dart';
import 'package:snokie_shoe/utils/font_and_margin.dart';

class ComingSoonScreen extends StatelessWidget {

  final String? title;
  final bool isBackIcon ;
  const ComingSoonScreen({super.key,  this.title,this.isBackIcon= false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
           onTap: isBackIcon? ()=> Navigator.pop(context) : (){},
            child: Icon(Icons.arrow_back_ios,color: isBackIcon?textColor: Colors.transparent,)),
        title: Text(title??"Coming soon",style: TextStyle(color: textColor),),elevation: 0,
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: kDefaultMarginHeight),

        child: Center(
          child: Lottie.asset("assets/icon/coming.json",width: double.infinity,height: double.infinity),
        ),
      ),
    );
  }
}
