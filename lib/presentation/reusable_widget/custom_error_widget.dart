import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomErrorWidget extends StatelessWidget {
  final String? icon;
  final bool? isButton;
  final String title;
  final String? buttonTitle;
  final VoidCallback? onClick;

  const CustomErrorWidget(
      {Key? key,
        this.icon,
        this.isButton,
        required this.title,
        this.buttonTitle,
        this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: 80,
            width: 80,
            child: SvgPicture.asset(icon ?? "assets/icon/error.svg")),
        const  SizedBox(height: 8,),
        Text(title,style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 15),),
        const  SizedBox(height: 8,),
        if(isButton == true)  SizedBox(
            height: 28,
            child: ElevatedButton(onPressed: onClick, child: Text(buttonTitle??"Try Again",style: const TextStyle(fontSize: 12),)))
      ],
    );
  }
}