import 'package:app_e_commerce/core/routing/routes.dart';
import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/core/utils/shared_preference.dart';
import 'package:app_e_commerce/features/home/presentation/screens/home_tab.dart';
import 'package:app_e_commerce/features/home/presentation/widgets/default_bottom_navigation_bar.dart';
import 'package:app_e_commerce/features/products/presentation/screens/product_tab.dart';
import 'package:app_e_commerce/features/wishlist/presentation/screens/favorite_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    ProductTab(),
    FavoriteTab(),
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
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/route.png',
                    ),
                    IconButton(
                        onPressed: () {
                          SharedPreferenceUtils.removeData(key: 'Token');
                          Navigator.of(context)
                              .pushReplacementNamed(Routes.loginScreen);
                        },
                        icon: Icon(
                          Icons.logout,
                          size: 28.sp,
                          color: MyTheme.mainColor,
                        )),
                  ],
                ),
                SizedBox(
                  height: 18.h,
                ),
                tabs[selectedIndex],
              ])),
        )));
  }
}
