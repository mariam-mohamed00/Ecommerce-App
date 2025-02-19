import 'package:app_e_commerce/features/home/presentation/tabs/favorite_tab/favorite_tab.dart';
import 'package:app_e_commerce/features/home/presentation/tabs/home_tab/home_tab.dart';
import 'package:app_e_commerce/features/home/presentation/tabs/product_tab/product_tab.dart';
import 'package:app_e_commerce/features/home/presentation/tabs/profile_tab/profile_tab.dart';
import 'package:app_e_commerce/features/home/presentation/widgets/default_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const ProductTab(),
    const FavoriteTab(),
    const ProfileTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: defaultBottomNavigationBar(
          selectedIndex: selectedIndex,
          onTabFunction: (index) {
            selectedIndex = index;
            setState(() {});
          },
          context: context),
      body: tabs[selectedIndex],
    );
  }
}
