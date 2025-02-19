import 'package:app_e_commerce/features/home/presentation/cubit/home_screen_cubit.dart';
import 'package:app_e_commerce/features/home/presentation/cubit/home_screen_states.dart';
import 'package:app_e_commerce/features/home/presentation/widgets/default_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  HomeScreenCubit homeScreenCubit = HomeScreenCubit();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
      bloc: homeScreenCubit,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: defaultBottomNavigationBar(
              selectedIndex: homeScreenCubit.selectedIndex,
              onTabFunction: (index) {
                homeScreenCubit.changeBottomNavigationBar(index);
              },
              context: context),
          body: homeScreenCubit.tabs[homeScreenCubit.selectedIndex],
        );
      },
    );
  }
}
