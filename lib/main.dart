import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:transport_app/business_logic/app_cubit.dart';
import 'package:transport_app/business_logic/app_states.dart';
import 'package:transport_app/presentation/screens/Login_screen/login_screen.dart';
import 'package:transport_app/presentation/screens/home_layout/home_layout.dart';
import 'package:transport_app/presentation/screens/sign_up_screen/view/sign_up_screen.dart';
import 'package:transport_app/presentation/screens/splash_screen/splash_screen.dart';
import 'package:transport_app/styles/theme_manager/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return GetMaterialApp(
              title: 'Transport App',
              theme: getApplicationTheme(context),
              debugShowCheckedModeBanner: false,
              home: const LoginScreen(),
            );
          },
      ),
    );
  }
}

