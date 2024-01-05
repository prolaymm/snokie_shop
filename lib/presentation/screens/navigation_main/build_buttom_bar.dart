import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/color_constants.dart';

class BuildBottomBar extends StatelessWidget {
  final int mSelectedIndex;
  final Function(int) onNavItemClick;
  final List<BottomNavigationBarItem> mNavBarItemList;
  const BuildBottomBar(
      {Key? key,
      required this.mSelectedIndex,
      required this.onNavItemClick,
      required this.mNavBarItemList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: mSelectedIndex,
      selectedFontSize: 12,

      selectedIconTheme: const IconThemeData(color: primaryColor),
      unselectedItemColor: Theme.of(context).hintColor,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedFontSize: 12,
      selectedLabelStyle: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 12),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 24,
      type: BottomNavigationBarType.fixed,
      backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      onTap: onNavItemClick,
      items: mNavBarItemList,
    );
  }
}

BottomNavigationBarItem buildItem(
    {required int index,
    required context,
    required String icon,
      required String selectedIcon,
    bool isCart = false,
    String? value,
    String? count,
    customIcon,
     String? title,
    required selectedIndex,
    Icon? materialIcon,
    bool isIcon = false}) {
  return BottomNavigationBarItem(
    icon:    SizedBox(
        height: selectedIndex==index?28 : 24,
        width: 80,
        child: index==selectedIndex? Lottie.asset(selectedIcon,width: 80,height: 80) :  SvgPicture.asset(icon,
            height: 12,
            colorFilter: ColorFilter.mode(
                selectedIndex == index
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
                BlendMode.srcIn))),
      /*icon: SizedBox(
        width: 40,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
                height: 80,
                width: 80,
                child: index==selectedIndex? Lottie.asset(selectedIcon,width: 40,height: 40) :  SvgPicture.asset(icon,
                        height: 12,
                        colorFilter: ColorFilter.mode(
                            selectedIndex == index
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            BlendMode.srcIn))),
            if (isCart)
              Positioned(
                  right: -10,
                  top: -6,
                  child: Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: Center(
                        child: Text(
                      "$count",
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    )),
                  )),
          ],
        ),
      ),*/
      label: title??"",);
}
