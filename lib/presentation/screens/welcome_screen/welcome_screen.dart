import 'package:flutter/material.dart';
import 'package:snokie_shoe/utils/font_and_margin.dart';
import 'package:snokie_shoe/viewmodel/welcome_view_model.dart';

class WelcomeScreen extends StatelessWidget {

  final WelcomeViewModel viewModel;
  const WelcomeScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding:const  EdgeInsets.symmetric(horizontal: kDefaultMarginWidth,vertical: kDefaultMarginHeight),
        decoration:const  BoxDecoration(
          image:  DecorationImage(
            image:  AssetImage("assets/image/welcome.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Text("Live Your\nPerfect",style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 44,color: Colors.white),textAlign: TextAlign.center,),
            Text("Smart, gorgeous & fashionable\ncollection make you cool",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),textAlign: TextAlign.center,),

            const SizedBox(height: 80,),
            SizedBox(
                height: 54,
                width: double.infinity,
                child: ElevatedButton(onPressed: (){

                  viewModel.onChangeScreenStatus(context: context);
                }, child: const Text("Start",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),))),


          ],
        ),
      ),
    );
  }
}
