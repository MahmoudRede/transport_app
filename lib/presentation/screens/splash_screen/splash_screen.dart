import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transport_app/business_logic/app_cubit.dart';
import 'package:transport_app/business_logic/app_states.dart';
import 'package:transport_app/presentation/screens/on_boarding_screen/screen/on_boarding_screen.dart';
import 'package:transport_app/styles/colors/color_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    Future.delayed(const Duration(seconds: 3),()async{

      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
       const OnBoarding()
      ), (Route<dynamic> route) => false);

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

      },
      builder: (context,state){
        return Scaffold(
          backgroundColor: ColorManager.white,
          body: GestureDetector(
            onTap: (){
            },
            child: Container(
              padding: EdgeInsets.zero,
              height: double.infinity,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    height: MediaQuery.sizeOf(context).height*.6,
                    width: MediaQuery.sizeOf(context).height*.45,
                    image: const AssetImage('assets/images/smart-logo.jpeg'),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
