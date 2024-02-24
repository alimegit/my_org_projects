import 'package:default_project/screens/profile_screen.dart';
import 'package:default_project/screens/transactions_screen.dart';
import 'package:default_project/screens/transfer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_images.dart';
import '../utils/appcolors.dart';
import 'mycards_screen.dart';

class TabBox2 extends StatefulWidget {
  const TabBox2({super.key});

  @override
  State<TabBox2> createState() => _TabBox2State();
}

class _TabBox2State extends State<TabBox2> {
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
      body: IndexedStack(
        index: _activeIndex,
        children: _screens,
      ),
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
            icon:  SvgPicture.asset(AppImages.home,color: AppColors.grey),
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
            label: "Profile",
          ),
        ],
      ),
    );
  }
}