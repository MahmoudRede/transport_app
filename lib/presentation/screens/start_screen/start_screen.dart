import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transport_app/business_logic/app_cubit.dart';
import 'package:transport_app/business_logic/app_states.dart';
import 'package:transport_app/presentation/screens/on_boarding_screen/screen/on_boarding_screen.dart';
import 'package:transport_app/presentation/widgets/default_button.dart';
import 'package:transport_app/styles/colors/color_manager.dart';

class StartScreen extends StatelessWidget {

  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

      },
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0.0,
          ),
          backgroundColor: ColorManager.white,
          body: Container(
            padding: EdgeInsets.zero,
            height: double.infinity,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image(
                  height: MediaQuery.sizeOf(context).height*.3,
                  width: MediaQuery.sizeOf(context).height*.45,
                  fit: BoxFit.cover,
                  image: const AssetImage('assets/images/smart-logo.jpeg'),
                ),

                Text(
                  'استمرت رابيت , خدمات توصيل وشحن الطرود',
                  style: TextStyle(
                      color: ColorManager.grey,
                      fontSize: MediaQuery.sizeOf(context).height*.022,
                      fontWeight: FontWeight.w500
                  ),
                ),

                SizedBox(height: MediaQuery.sizeOf(context).height*.05),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DefaultButton(
                        onPressed: (){},
                        backGroundColor: ColorManager.primaryColor,
                        height: MediaQuery.sizeOf(context).height*.07,
                        width: MediaQuery.sizeOf(context).width*.4,
                        content: const Text('انشاء حساب جديد',style: TextStyle(
                          color: ColorManager.white
                        ),
                    )),

                    DefaultButton(
                        onPressed: (){},
                        backGroundColor: ColorManager.white,
                        height: MediaQuery.sizeOf(context).height*.07,
                        width: MediaQuery.sizeOf(context).width*.4,
                        content: const Text('تسجيل الدخول',style: TextStyle(
                          color: ColorManager.primaryColor
                        ),
                        )),
                  ],
                )

              ],
            ),
          ),
        );
      },
    );
  }
}
