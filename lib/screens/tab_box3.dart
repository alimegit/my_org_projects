import 'package:default_project/screens/profile_screen.dart';
import 'package:default_project/screens/transactions_screen.dart';
import 'package:default_project/screens/transfer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_images.dart';
import '../utils/appcolors.dart';
import 'mycards_screen.dart';
class TabBox3 extends StatefulWidget {
  const TabBox3({super.key});

  @override
  State<TabBox3> createState() => _TabBox3State();
}

class _TabBox3State extends State<TabBox3> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ProfileScreen(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newActiveIndex) {
          _activeIndex = newActiveIndex;
          setState(() {});
          switch (newActiveIndex) {
            case 1:
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyCardsScreen(
                        onTap: () {
                          setState(() {
                            _activeIndex = 0;
                          });
                        },
                      );
                    },
                  ),
                );
                break;
              }
            case 2:
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfileScreen(
                        onTap: () {
                          setState(() {
                            _activeIndex = 0;
                          });
                        },
                      );
                    },
                  ),
                );
                break;
              }
            case 4:
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TransactionsScreen(
                        onTap: () {
                          setState(() {
                            _activeIndex = 0;
                          });
                        },
                      );
                    },
                  ),
                );
                break;
              }
            case 4:
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TransfersScreen(
                        onTap: () {
                          setState(() {
                            _activeIndex = 0;
                          });
                        },
                      );
                    },
                  ),
                );
                break;
              }
          }
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