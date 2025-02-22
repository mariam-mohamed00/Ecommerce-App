import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget defaultBottomNavigationBar(
    {required int selectedIndex,
    required Function(int) onTabFunction,
    required BuildContext context}) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
    child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: MyTheme.mainColor,
        elevation: 0.0,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: selectedIndex,
        onTap: onTabFunction,
        items: [
          BottomNavigationBarItem(
              icon: CircleAvatar(
                foregroundColor:
                    selectedIndex == 0 ? MyTheme.mainColor : MyTheme.whiteColor,
                backgroundColor: selectedIndex == 0
                    ? MyTheme.whiteColor
                    : Colors.transparent,
                radius: 20.r,
                child: ImageIcon(
                  const AssetImage('assets/icons/product.png'),
                  size: 40.sp,
                ),
              ),
              label: 'Product'),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                foregroundColor:
                    selectedIndex == 1 ? MyTheme.mainColor : MyTheme.whiteColor,
                backgroundColor: selectedIndex == 1
                    ? MyTheme.whiteColor
                    : Colors.transparent,
                radius: 20.r,
                child: ImageIcon(
                  const AssetImage('assets/icons/home.png'),
                  size: 40.sp,
                ),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                foregroundColor:
                    selectedIndex == 2 ? MyTheme.mainColor : MyTheme.whiteColor,
                backgroundColor: selectedIndex == 2
                    ? MyTheme.whiteColor
                    : Colors.transparent,
                radius: 20.r,
                child: ImageIcon(
                  const AssetImage('assets/icons/favorite.png'),
                  size: 40.sp,
                ),
              ),
              label: 'Favorite'),
        ]),
  );
}
