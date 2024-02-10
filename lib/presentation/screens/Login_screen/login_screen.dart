import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:transport_app/business_logic/app_cubit.dart';
import 'package:transport_app/business_logic/app_states.dart';
import 'package:transport_app/presentation/screens/Login_screen/verifiy_phone_number.dart';
import 'package:transport_app/presentation/screens/sign_up_screen/view/sign_up_screen.dart';
import 'package:transport_app/presentation/widgets/country_code_picker.dart';
import 'package:transport_app/presentation/widgets/default_button.dart';
import 'package:transport_app/presentation/widgets/default_text_field.dart';
import 'package:transport_app/styles/app_size_config.dart';
import 'package:transport_app/styles/colors/color_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: ColorManager.white,
            appBar: AppBar(
              iconTheme: const IconThemeData(color: ColorManager.black),
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: ColorManager.white,
                  statusBarIconBrightness: Brightness.dark),
              toolbarHeight: 0.0,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.025),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: SizeConfig.height * .03,),

                    Align(
                      alignment: Alignment.center,
                      child: Image(
                        height: SizeConfig.height * 0.25,
                        width: SizeConfig.height * 0.4,
                        image: const AssetImage('assets/images/smart-logo.jpeg'),
                      ),
                    ),

                    SizedBox(
                      height: SizeConfig.height * .01,
                    ),

                    /// text
                    Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        color: ColorManager.black,
                        fontSize: SizeConfig.headline1Size,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(
                      height: SizeConfig.height * .015,
                    ),

                    /// text
                    Text(
                      'أدخل رقم الهاتف للبدء في توصيل شحناتك مع Smart Rabbit',
                      style: TextStyle(
                        color: ColorManager.darkGrey,
                        fontSize: SizeConfig.headline5Size,
                      ),
                    ),

                    SizedBox(height: SizeConfig.height * .05,),

                    /// phone number
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(flex: 1, child: CountryCodePickerWidget()),

                        SizedBox(width: SizeConfig.height * .005,),

                        Expanded(
                          flex: 3,
                          child: DefaultTextField(
                            onTap: (){},
                            controller: AppCubit
                                .get(context)
                                .loginPhoneNumberController,
                            hintText: 'أدخل رقم الهاتف',
                            validator: (value)=>"رقم الهاتف مطلوب",
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.done,
                          ),
                        ),

                      ],
                    ),

                    SizedBox(height: SizeConfig.height * .05,),

                    /// Login button
                    DefaultButton(
                      onPressed: () {
                        Get.to(const VerifyPhoneScreen(verificationId: "", phoneNumber: "", id: 1));
                      },
                      content: Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                          color: ColorManager.white,
                          fontSize: SizeConfig.headline5Size,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      backGroundColor: ColorManager.black,
                      width: SizeConfig.width,
                      height: SizeConfig.height * .058,
                    ),

                    SizedBox(
                      height: SizeConfig.height * .1,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                           "ليس لدك حساب؟ ",
                          style: TextStyle(
                            color: ColorManager.darkGrey,
                            fontSize: SizeConfig.headline4Size,
                            fontWeight: FontWeight.w500
                          ),
                        ),


                        /// sign up text button
                        InkWell(
                          onTap: () {
                            Get.to(const SignUpScreen());
                          },
                          child: Text(
                            "تسجيل",
                            style: TextStyle(
                              color: ColorManager.blue,
                              fontSize: SizeConfig.headline4Size,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),),
        );
      },
    );
  }
}
