import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transport_app/business_logic/app_cubit.dart';
import 'package:transport_app/business_logic/app_states.dart';
import 'package:transport_app/presentation/screens/home_screen/widgets/add_order.dart';
import 'package:transport_app/presentation/screens/home_screen/widgets/recieve_order.dart';

import '../../../../styles/colors/color_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        shape: const Border(
            bottom: BorderSide(
                color: ColorManager.white, width: 1.0)),
        elevation: 0.0,
        title: Row(
          children: [
            Image.asset(
              "assets/images/smart-logo.jpeg",
              fit: BoxFit.contain,
              height: MediaQuery.sizeOf(context).height * .08,
            ),
            const Text(
              "Smart Rabit",
              style: TextStyle(color: ColorManager.primaryColor),
            ),
          ],
        ),
      ),
      body: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Column(
            children: [
              DefaultTabController(
                length: 2,
                child: TabBar(
                  onTap: (index) {
                    cubit.changeHomeIndex(index);
                  },
                  physics: const BouncingScrollPhysics(),
                  dividerColor: ColorManager.gray,
                  indicatorColor: ColorManager.primaryColor,
                  isScrollable: false,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabAlignment: TabAlignment.fill,
                  labelColor: ColorManager.primaryColor,
                  unselectedLabelColor: ColorManager.grey,
                  unselectedLabelStyle: TextStyle(
                    fontSize: MediaQuery.sizeOf(context).height * .02,
                    fontWeight: FontWeight.bold,
                  ),
                  labelStyle: TextStyle(
                    fontSize: MediaQuery.sizeOf(context).height * .02,
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: const [
                    Tab(
                      text: 'استلام شحنة',
                    ),
                    Tab(
                      text: 'إضافة شحنة',
                    ),
                  ],
                ),
              ),
              cubit.homeIndex == 1
                  ? const Expanded(
                      child: AddOrderWidget(),
                    )
                  : const Expanded(
                      child: ReceiveOrder(),
                    )
            ],
          );
        },
      ),
    );
  }
}
