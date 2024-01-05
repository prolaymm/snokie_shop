import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snokie_shoe/presentation/screens/coming_soon_screen/coming_soon_screen.dart';
import 'package:snokie_shoe/presentation/screens/home_screen/home_screen.dart';
import '../../../viewmodel/navigation_main_view_model.dart';
import '../save_screen/save_screen.dart';
import 'build_buttom_bar.dart';

class NavigationMainScreen extends StatelessWidget {
  const NavigationMainScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationMainViewModel(context: context),
      child: Consumer<NavigationMainViewModel>(builder: (_, viewModel, __) {
        return Scaffold(
          body: IndexedStack(
            index: viewModel.mSelectedIndex,
            children: const [
              HomeScreen(),
              ComingSoonScreen(title: "Cart",),
              SaveScreen(),
            ComingSoonScreen(title: "Search",),
            ],
          ),
          bottomNavigationBar: BuildBottomBar(
            onNavItemClick: viewModel.onNavItemClick,
            mSelectedIndex: viewModel.mSelectedIndex,
            mNavBarItemList: _onGenerateBottomNavBar(
                context: context, mSelectedIndex: viewModel.mSelectedIndex),
          ),
        );
      }),
    );
  }
}

List<BottomNavigationBarItem> _onGenerateBottomNavBar(
    {required context, required int mSelectedIndex}) {
  return [
    buildItem(
        index: 0,
        icon: "assets/icon/ic_home.svg",
      selectedIcon: 'assets/icon/lt_home.json',
        title: "Feed",
        //    title: TKeys.home.translate(context),
        context: context,
        selectedIndex: mSelectedIndex, ),
    buildItem(
        index: 1,
        icon: "assets/icon/ic_cart.svg",
        selectedIcon: 'assets/icon/lt_cart.json',
        //   title: TKeys.wishList.translate(context),
        context: context,
        count: "10",
        isCart : true,
        selectedIndex: mSelectedIndex),
    buildItem(
        index: 2,
        icon: "assets/icon/ic_save.svg",
        selectedIcon: 'assets/icon/lt_save.json',
        //   title: TKeys.booking.translate(context),
        context: context,
        selectedIndex: mSelectedIndex),
    buildItem(
        index: 3,
        icon: "assets/icon/ic_search.svg",
        selectedIcon: 'assets/icon/lt_search.json',
        //       title: TKeys.explore.translate(context),
        context: context,
        selectedIndex: mSelectedIndex)
  ];
}
