import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:transport_app/business_logic/app_cubit.dart';
import 'package:transport_app/business_logic/app_states.dart';
import 'package:transport_app/presentation/screens/home_layout/home_layout.dart';
import 'package:transport_app/presentation/widgets/custom_pin_put_widget.dart';
import 'package:transport_app/presentation/widgets/default_button.dart';
import 'package:transport_app/styles/app_size_config.dart';
import 'package:transport_app/styles/colors/color_manager.dart';

class VerifyPhoneScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;
  final int id;

  const VerifyPhoneScreen(
      {super.key, required this.verificationId, required this.phoneNumber, required this.id});

  @override
  State<VerifyPhoneScreen> createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {

  @override
  void initState() {
    // TODO: implement initState
    // context.read<AuthCubit>().resendOtpTimer();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement
    // context.read<AuthCubit>().secondTimer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.white,
            appBar: AppBar(
              iconTheme: const IconThemeData(
                  color: ColorManager.black
              ),
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: ColorManager.white,
                  statusBarIconBrightness: Brightness.dark
              ),
              backgroundColor: ColorManager.white,
              centerTitle: true,
              title: Text(
                'أكد رقم الهاتف',
                style: TextStyle(
                    fontSize: SizeConfig.headline2Size,
                    color: ColorManager.black
                ),),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.height * .035),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(height: SizeConfig.height * 0.18,),


                    /// text
                    Text('أدخل كود التأكيد',
                      style: TextStyle(
                        color: ColorManager.black,
                        fontSize: SizeConfig.headline2Size,
                        fontWeight: FontWeight.w600,
                    ),
                      textAlign: TextAlign.center,
                    ),

                    /// text
                    Text(
                      'لقد أرسلنا لك رسالة نصية على\n'
                          ' +966123456789 تحتوي على رمز التحقق المكوّن من ستة أرقام',
                      style: TextStyle(
                          color: ColorManager.darkGrey,
                          fontSize: SizeConfig.headline4Size
                      ),
                      textAlign: TextAlign.center,
                    ),


                    SizedBox(height: SizeConfig.height * .05,),

                    /// OTP
                    CustomPinPutWidget(
                        otpController: AppCubit.get(context).verifyOtpPinPutController,
                        onChanged: (val) {},
                        onSubmit: (val) {},
                        validator: (val) =>"Enter valid code",
                        enabled: true,
                        length: 6
                    ),

                    SizedBox(height: SizeConfig.height * .05,),

                    // resend code button and timer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: true,
                          child: Text(
                            '0:0',
                            style: TextStyle(
                              fontSize: SizeConfig.headline3Size,
                              fontWeight: FontWeight.w500,
                              color: ColorManager.black,
                            ),
                          ),
                        ),

                        SizedBox(width: SizeConfig.height * 0.002,),

                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "إعادة أرسال الكود",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: SizeConfig.headline3Size,
                              fontWeight: FontWeight.w500,
                              color: ColorManager.primary,
                            ),

                          ),
                        ),
                      ],
                    ),

                    /// Login button
                    DefaultButton(
                      content: Text(
                        "تأكيد",
                        style: TextStyle(
                          color: ColorManager.white,
                          fontSize: SizeConfig.headline4Size,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      onPressed: () {
                        Get.offAll(const HomeLayout());
                      },
                      backGroundColor: ColorManager.black,
                      width: SizeConfig.width,
                      height: SizeConfig.height * .058,
                    ),

                  ],
                ),
              ),
            )
        );
      },
    );
  }
}