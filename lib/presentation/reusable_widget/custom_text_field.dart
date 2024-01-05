import 'package:flutter/material.dart';
import 'package:snokie_shoe/utils/color_constants.dart';

class CustomTextField extends StatelessWidget {

  final String? label;
  final String? hint;
   final TextEditingController? textController;
   final TextInputType? textInputType;
   final Function? onChange;
   final String? initialTexxt;
   final int? maxLine;
   final double? size;
   final bool? isEnable;
   final Widget? suffixIcon;
  const CustomTextField({Key? key, this.label, this.hint, this.textController, this.textInputType, this.onChange, this.initialTexxt, this.maxLine, this.size=48, this.suffixIcon, this.isEnable,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
         child: TextFormField(
        maxLines: maxLine,
        autofocus: false,
        enabled: isEnable ,
        readOnly: isEnable??false,
        initialValue: initialTexxt,
        onChanged: (value)=>onChange!(value),
        controller: textController,
        keyboardType: textInputType,
        cursorColor: primaryColor,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint??"",
          contentPadding:  EdgeInsets.only(top: size==200?24:8,left: 8,right: 8),
          hintStyle: TextStyle(color: hintColor),
       //   label: Text(label??"",style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 16),),
          border:  OutlineInputBorder(
           borderSide:const BorderSide(color:Colors.transparent,width: 1,),
            borderRadius: BorderRadius.circular(12)
          ),
          suffixIcon: suffixIcon,
          focusedBorder:  OutlineInputBorder(
           borderSide: BorderSide(color: Colors.transparent,width: 1),
              borderRadius: BorderRadius.circular(12)
          ),
          disabledBorder:   OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent,width: 1),
             borderRadius: BorderRadius.circular(12)
         ),
          enabledBorder:  OutlineInputBorder(
           borderSide: BorderSide(color: Colors.transparent,width: 1),
              borderRadius: BorderRadius.circular(12)
          ),
        ),
      ),
    );
  }
}