import 'package:flutter/material.dart';
import 'package:t_store/core/constants/text_strings.dart';
import 'package:t_store/features/payment/screens/payment_methods_page.dart';
import 'package:t_store/features/transaction/screens/transaction_page.dart';
import '../core/constants/colors.dart';
import 'account/screens/account_page.dart';
import 'home/screens/home_page.dart';
import 'settings/screens/language_setting.dart';
import 'package:easy_localization/easy_localization.dart';


class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    PaymentMethodsPage() ,
    const AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.blue,
        unselectedItemColor: AppColors.textGray,
        backgroundColor:AppColors.white,
        items:  [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home ,size: 30,),
            label: AppTexts.home.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.confirmation_num ,size: 30,),
            label: AppTexts.transaction.tr(),
          ),
           BottomNavigationBarItem(
            icon: const Icon(Icons.person,size: 30,),
            label: AppTexts.account.tr(),
          ),

        ],
      ),
    );
  }
}
