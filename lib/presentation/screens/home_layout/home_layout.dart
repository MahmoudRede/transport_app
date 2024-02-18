import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transport_app/business_logic/app_cubit.dart';
import 'package:transport_app/business_logic/app_states.dart';
import 'package:transport_app/styles/colors/color_manager.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: MediaQuery.sizeOf(context).height*.01,
            backgroundColor:  ColorManager.white,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type:  BottomNavigationBarType.fixed,
            selectedItemColor: ColorManager.primaryColor,
            unselectedItemColor: ColorManager.grey,

            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.vertical_split), label: 'الشحنات'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'البروفايل'),
            ],
            currentIndex: cubit.currentIndex,
            onTap: (value) {
              cubit.setIndex(value);
            },
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
