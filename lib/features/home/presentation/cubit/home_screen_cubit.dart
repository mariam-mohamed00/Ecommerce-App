import 'package:app_e_commerce/features/home/presentation/cubit/home_screen_states.dart';
import 'package:app_e_commerce/features/home/presentation/tabs/favorite_tab/favorite_tab.dart';
import 'package:app_e_commerce/features/home/presentation/tabs/home_tab/home_tab.dart';
import 'package:app_e_commerce/features/home/presentation/tabs/product_tab/product_tab.dart';
import 'package:app_e_commerce/features/home/presentation/tabs/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());

  int selectedIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const ProductTab(),
    const FavoriteTab(),
    const ProfileTab()
  ];

  void changeBottomNavigationBar(int newSelectedIndex) {
    HomeScreenInitialState();
    selectedIndex = newSelectedIndex;
    emit(ChangeBottomNavigationBar());
  }
}
