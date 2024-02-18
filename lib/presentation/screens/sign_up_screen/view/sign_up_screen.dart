import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:transport_app/business_logic/app_cubit.dart';
import 'package:transport_app/business_logic/app_states.dart';
import 'package:transport_app/presentation/screens/Login_screen/login_screen.dart';
import 'package:transport_app/presentation/widgets/country_code_picker.dart';
import 'package:transport_app/presentation/widgets/default_button.dart';
import 'package:transport_app/presentation/widgets/default_text_field.dart';
import 'package:transport_app/styles/app_size_config.dart';
import 'package:transport_app/styles/colors/color_manager.dart';

class SignUpScreen extends StatelessWidget {

  const SignUpScreen({super.key});

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
            body: Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.height * 0.025,
                  right: SizeConfig.height * 0.025,
                  top: SizeConfig.topPadding),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Align(
                      alignment: Alignment.center,
                      child: Image(
                        height: SizeConfig.height * 0.2,
                        width: SizeConfig.height * 0.4,
                        image: const AssetImage('assets/images/smart-logo.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),

                    /// text
                    Text(
                      "تسجيل السائق",
                      style: TextStyle(
                        color: ColorManager.black,
                        fontSize: SizeConfig.headline2Size,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: SizeConfig.height * .015,),

                    DefaultTextField(
                      controller: AppCubit
                          .get(context)
                          .signUpFullNameController,
                      hintText: 'الأسم كاملا',
                      validator: (val) => "",
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onTap: () {},
                    ),

                    SizedBox(
                      height: SizeConfig.height * .02,
                    ),

                    DefaultTextField(
                      controller: AppCubit
                          .get(context)
                          .signUpEmailController,
                      hintText: 'البريد الإلكترونى',
                      validator: (val) => "",
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onTap: () {},
                    ),

                    SizedBox(height: SizeConfig.height * .02,),

                    /// phone number
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(flex: 1, child: CountryCodePickerWidget()),
                        SizedBox(
                          width: SizeConfig.height * .005,
                        ),
                        Expanded(
                          flex: 3,
                          child: DefaultTextField(
                              controller: AppCubit
                                  .get(context)
                                  .signUpPhoneNumberController,
                              hintText: 'رقم الجوال',
                              validator: (val) => "",
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.done,
                              onTap: () {}),
                        ),
                      ],
                    ),

                    SizedBox(height: SizeConfig.height * .02,),

                    // DefaultTextField(
                    //   controller: AppCubit
                    //       .get(context)
                    //       .signUpPasswordController,
                    //   hintText: 'كلمة المرور',
                    //   validator: (val) =>"",
                    //   isPassword: true,
                    //   keyboardType: TextInputType.visiblePassword,
                    //   textInputAction: TextInputAction.next,
                    //   onTap: () {},
                    // ),
                    //
                    // SizedBox(height: SizeConfig.height * .02,),
                    //
                    // DefaultTextField(
                    //   controller: AppCubit
                    //       .get(context)
                    //       .signUpConfirmPasswordController,
                    //   hintText: 'تأكيد كلمة المرور',
                    //   validator: (val) =>"",
                    //   isPassword: true,
                    //   keyboardType: TextInputType.visiblePassword,
                    //   textInputAction: TextInputAction.next,
                    //   onTap: () {},
                    // ),
                    //
                    // SizedBox(height: SizeConfig.height * .02,),



                    DefaultTextField(
                      controller: AppCubit
                          .get(context)
                          .signUpAddressController,
                      hintText: 'العنوان',
                      validator: (val) => "",
                      keyboardType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      onTap: () {},
                    ),
                    SizedBox(height: SizeConfig.height * .02,),

                    DefaultTextField(
                      controller: AppCubit
                          .get(context)
                          .signUpAboutMeController,
                      hintText: 'نبذة عن',
                      validator: (val) => "",
                      maxLines: 4,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      onTap: () {},
                    ),

                    SizedBox(height: SizeConfig.height * .05,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "تحديد الجنس",
                          style: TextStyle(
                            color: ColorManager.black,
                            fontSize: SizeConfig.headline3Size,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Row(
                          children: [
                            Radio(
                              value: 1,
                              activeColor: ColorManager.blue,
                              groupValue: AppCubit.get(context).selectedValue,
                              onChanged: (int? value) {
                                AppCubit.get(context).changeUserSex(value);
                              },
                            ),
                            Text(
                              'ذكر',
                              style: TextStyle(
                                fontSize: SizeConfig.headline4Size,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.black,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Radio(
                              value: 2,
                              activeColor: ColorManager.blue,
                              groupValue: AppCubit.get(context).selectedValue,
                              onChanged: (int? value) {
                                AppCubit.get(context).changeUserSex(value);
                              },
                            ),
                            Text(
                              'أنثى',
                              style: TextStyle(
                                fontSize: SizeConfig.headline4Size,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: SizeConfig.height * .01,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "ارفاق مستندات",
                        style: TextStyle(
                          color: ColorManager.black,
                          fontSize: SizeConfig.headline3Size,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    SizedBox(height: SizeConfig.height * .01,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.attach_file,
                              color: ColorManager.grey,
                              size: SizeConfig.height * 0.022,
                            ),
                            Text(
                              "ارفاق صورة الهوية",
                              style: TextStyle(
                                color: ColorManager.black,
                                fontSize: SizeConfig.headline4Size,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        DefaultButton(
                          onPressed: () async {},
                          backGroundColor: ColorManager.grey,
                          width: SizeConfig.height * 0.15,
                          height: SizeConfig.height * .035,
                          content: Text(
                            "أضافة",
                            style: TextStyle(
                              color: ColorManager.white,
                              fontSize: SizeConfig.headline4Size,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.attach_file,
                              color: ColorManager.grey,
                              size: SizeConfig.height * 0.022,
                            ),
                            Text(
                              "ارفاق رخصة السيارة",
                              style: TextStyle(
                                color: ColorManager.black,
                                fontSize: SizeConfig.headline4Size,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        DefaultButton(
                          onPressed: () async {},
                          backGroundColor: ColorManager.grey,
                          width: SizeConfig.height * 0.15,
                          height: SizeConfig.height * .035,
                          content: Text(
                            "أضافة",
                            style: TextStyle(
                              color: ColorManager.white,
                              fontSize: SizeConfig.headline4Size,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),


                    SizedBox(height: SizeConfig.height * .04,),
                    /// sign up button
                    DefaultButton(
                      onPressed: () async {},
                      backGroundColor: ColorManager.black,
                      width: SizeConfig.height * 0.9,
                      height: SizeConfig.height * .058,
                      content: Text(
                        "تسجيل",
                        style: TextStyle(
                          color: ColorManager.white,
                          fontSize: SizeConfig.headline4Size,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: SizeConfig.height * 0.03,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("لدى حساب الفعل , ",
                          style: TextStyle(
                            color: ColorManager.darkGrey,
                            fontSize: SizeConfig.headline4Size,
                          ),
                        ),

                        /// sign up text button
                        InkWell(
                          onTap: () {
                            Get.to(const LoginScreen());
                          },
                          child: Text(
                            "تسجيل الدخول",
                            style: TextStyle(
                              color: ColorManager.black,
                              fontSize: SizeConfig.headline4Size,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: SizeConfig.height * .05,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
