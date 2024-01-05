import 'package:flutter/material.dart';



class NavigationMainViewModel extends ChangeNotifier {

  NavigationMainViewModel({required context}) {

   debugPrint("Working on Navigation View Model $mSelectedIndex" );
  }

  int mSelectedIndex = 0;
  onNavItemClick(int index) {
    mSelectedIndex = index;
    print("$mSelectedIndex");
   notifyListeners();
  }

}