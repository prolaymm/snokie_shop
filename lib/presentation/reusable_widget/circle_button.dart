
import 'package:flutter/material.dart';
import 'package:snokie_shoe/utils/color_constants.dart';

class CircleButton extends StatelessWidget {

  final IconData icon;
  final double size;
  final double iconSize;
  final Color? iconColor;
  final Color? circleColor;
  final VoidCallback? onClick;
  const CircleButton({super.key, required this.icon, required this.size, this.iconColor, this.onClick, this.circleColor, required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: size,
        height: size,
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color:circleColor?? Colors.white,
          border: Border.all(color: Color(0xffe3e3e3))
        ),
        child: Icon(icon,size: iconSize,color: iconColor??textColor,),
      ),
    );
  }
}
