import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:snokie_shoe/domain/data/impl/shoe_repo_impl.dart';
import 'package:snokie_shoe/domain/vos/shoe_vo.dart';
import 'package:snokie_shoe/presentation/screens/coming_soon_screen/coming_soon_screen.dart';
import 'package:snokie_shoe/presentation/screens/detail_screen/detail_screen.dart';
import 'package:snokie_shoe/presentation/screens/navigation_main/navigation_main_screen.dart';
import 'package:snokie_shoe/presentation/screens/welcome_screen/welcome_screen.dart';
import 'package:snokie_shoe/services/api_service/api_result.dart';
import 'package:snokie_shoe/utils/color_constants.dart';
import 'package:snokie_shoe/utils/font_and_margin.dart';
import 'package:snokie_shoe/viewmodel/welcome_view_model.dart';

import 'core/hive_helper.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await HiveHelper().openHiveBox();

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    bool isFirstTime = true;
    return ChangeNotifierProvider(

      create:(_)=> WelcomeViewModel(),
      child: Consumer<WelcomeViewModel>(
        builder: (_,viewModel,__) {

          isFirstTime = viewModel.isFirstTime;
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: ThemeData(
                primaryColor: primaryColor,
                useMaterial3: false,
                scaffoldBackgroundColor: Colors.white,
                cardColor: Colors.white,
                dividerColor: Colors.transparent,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.white
                ),
                inputDecorationTheme: InputDecorationTheme(
                  labelStyle: const TextStyle(
                    color: primaryColor,
                  ),
                  hintStyle: const TextStyle(color: hintColor),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: hintColor),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: hintColor),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: hintColor),
                      borderRadius: BorderRadius.circular(10)),
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                ),
                shadowColor: const Color(0xfffafafa),
           /*         colorScheme: ColorScheme.fromSeed(
                  primary: primaryColor, seedColor: Colors.white,),*/
                cardTheme: const CardTheme(
                    color: Colors.white,
                    shadowColor: Colors.black12,
                    elevation: 8,
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
                outlinedButtonTheme: OutlinedButtonThemeData(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                       foregroundColor: primaryColor,
                        minimumSize: const Size(double.infinity, 42),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        textStyle: const TextStyle(
                            color: primaryColor, fontSize: kBodyFontSize),
                        side: const BorderSide(
                          color: primaryColor,
                          width: 1,
                        ))),
                elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      elevation: 0,
                      minimumSize: const Size(80, 42),
                      shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      textStyle:
                      const TextStyle(color: Colors.white, fontSize: kBodyFontSize),
                    )),
                textTheme: const TextTheme(
                  bodyMedium: TextStyle(
                      fontSize: 15,
                      color: textColor,
                      fontWeight: FontWeight.normal),
                  titleLarge: TextStyle(
                    fontSize: 20,
                    color: textColor,
                    fontWeight: FontWeight.bold),
                  titleMedium: TextStyle(
                      fontSize: 18,
                      color: textColor,
                      fontWeight: FontWeight.bold),
                  bodySmall: TextStyle(
                      fontSize: 12,
                      color: textColor,
                      fontWeight: FontWeight.normal),
                ),
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.white,
                    centerTitle: true,
                    iconTheme: IconThemeData(color: primaryColor),
                    elevation: 0,
                    shadowColor: Colors.black12,
                    titleTextStyle: TextStyle(
                        fontSize: 20,
                        color: textColor,
                        fontWeight: FontWeight.w500))),
            home: isFirstTime? WelcomeScreen(viewModel: viewModel,) : NavigationMainScreen()
          );
        }
      ),
    );
  }
}
