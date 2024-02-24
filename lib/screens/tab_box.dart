import 'package:default_project/screens/profile_screen.dart';
import 'package:default_project/screens/transactions_screen.dart';
import 'package:default_project/screens/transfer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/app_images.dart';
import '../utils/appcolors.dart';
import 'mycards_screen.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> _screens = [];
  int _activeIndex = 0;

  @override
  void initState() {
    _screens = [
      ProfileScreen(),
      MyCardsScreen(),
      TransactionsScreen(),
      TransfersScreen()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newActiveIndex) {
          _activeIndex = newActiveIndex;
          setState(() {});
        },
        currentIndex: _activeIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        backgroundColor: Colors.white,
        items:  [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.home,color: AppColors.white,),
            icon:  SvgPicture.asset(AppImages.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.cards,color: AppColors.white,),
            icon:SvgPicture.asset(AppImages.cards,color: AppColors.grey,),
            label: "Cards",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.transactions,color: AppColors.white,),
            icon:SvgPicture.asset(AppImages.transactions,color: AppColors.grey,),
            label: "Transactions",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.profile,color: AppColors.white,),
            icon:SvgPicture.asset(AppImages.profile,color: AppColors.grey,),
            label: "Transactions",
          ),
        ],
      ),
    );
  }
}
