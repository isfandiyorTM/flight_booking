import 'package:flutter/material.dart';
import 'package:t_store/features/account/screens/account_page.dart';
import 'package:t_store/features/home/screens/home_page.dart';
import 'package:t_store/features/transaction/screens/transaction_page.dart';

import '../core/constants/colors.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    const TransactionPage(),
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home ,size: 30,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_num ,size: 30,),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,size: 30,),
            label: 'Account',
          ),

        ],
      ),
    );
  }
}
