import 'package:flutter/material.dart';
import 'package:snokie_shoe/presentation/screens/navigation_main/navigation_main_screen.dart';
import 'package:snokie_shoe/utils/db_constants.dart';

import '../services/preference_service/preference_helper.dart';

class WelcomeViewModel extends ChangeNotifier {


  final PreferencesHelper _helper = PreferencesHelper();
  bool isFirstTime = true;

  WelcomeViewModel() {
    onGetWelcomeStatus();
  }

  onChangeScreenStatus({required context}) async{
    await _helper.setBool(welcomeKey, false);
     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) =>const NavigationMainScreen()),
             (Route<dynamic> route) => false);
  }

  onGetWelcomeStatus() async{
    isFirstTime = await _helper.getBool(welcomeKey)??true;
    notifyListeners();
  }


}
