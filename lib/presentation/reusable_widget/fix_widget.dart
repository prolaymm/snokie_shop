
import 'package:flutter/material.dart';

class FixWidget {

  static final FixWidget _singleton = FixWidget._internal();

  factory FixWidget() {

    return _singleton;
  }
  FixWidget._internal();

  /// snack bar
  void showSnackBar({required BuildContext context,required String title,Color? backgroundColor,TextStyle? textStyle,Duration? duration}) {
    final snackBar =  SnackBar(
      content: Text(title,style: textStyle,),
      backgroundColor:backgroundColor??Theme.of(context).primaryColor,
      duration: duration  ??const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }



}