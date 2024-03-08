import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:transport_app/business_logic/app_cubit.dart';
import 'package:transport_app/business_logic/app_states.dart';
import 'package:transport_app/constants/constants.dart';
import 'package:transport_app/presentation/screens/Login_screen/login_screen.dart';
import 'package:transport_app/presentation/widgets/country_code_picker.dart';
import 'package:transport_app/presentation/widgets/default_button.dart';
import 'package:transport_app/presentation/widgets/default_text_field.dart';
import 'package:transport_app/styles/app_size_config.dart';
import 'package:transport_app/styles/colors/color_manager.dart';
import 'package:transport_app/styles/theme_manager/font_manager.dart';

class SignUpScreen extends StatelessWidget {

   SignUpScreen({super.key});

   GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
              toolbarHeight: 0.0,
            ),
            body: Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.height * 0.025,
                  right: SizeConfig.height * 0.025,
                  top: SizeConfig.topPadding),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Align(
                        alignment: Alignment.center,
                        child: Image(
                          height: SizeConfig.height * 0.23,
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
                        validator: (val) {
                          if(val!.isEmpty){
                            return 'ادخل الأسم كاملا';
                          }
                        },
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
                        validator: (val) {
                          if(val!.isEmpty){
                            return 'ادخل البريد الإلكترونى';
                          }
                        },
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
                          Container(
                            padding: EdgeInsets.all(
                              SizeConfig.height * .01,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorManager.border,
                              ),
                              borderRadius: BorderRadius.circular(
                                SizeConfig.height * .01,
                              ),
                            ),
                            height: SizeConfig.height * .06,
                            child: Row(
                                children: [
                                  Image(
                                    height:SizeConfig.height * .03,
                                    image: const AssetImage('assets/images/saudi.png'),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.height * .01,
                                  ),
                                  Text(
                                    '+20',style:TextStyle(
                                    color: ColorManager.grey,
                                    fontSize: SizeConfig.height * .015,
                                  ) ,
                                  )
                                ]
                            ),
                          ),
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
                                validator: (val) {
                                  if(val!.isEmpty){
                                    return 'ادخل رقم الجوال';
                                  }
                                },
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.done,
                                onTap: () {}),
                          ),
                        ],
                      ),

                      SizedBox(height: SizeConfig.height * .02,),

                      DefaultTextField(
                        controller: AppCubit
                            .get(context)
                            .signUpAddressController,
                        hintText: 'العنوان',
                        validator: (val) {
                          if(val!.isEmpty){
                            return 'ادخل العنوان';
                          }
                        },
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
                        validator: (val) {
                          if(val!.isEmpty){
                            return 'ادخل نبذة عنك';
                          }
                        },
                        maxLines: 4,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        onTap: () {},
                      ),

                      SizedBox(height: SizeConfig.height * .025,),

                      Container(
                        height: SizeConfig.height * .06,
                        width: SizeConfig.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorManager.gray,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(SizeConfig.height*0.01),
                        ),

                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.height*0.015),
                          child: DropdownButton<String>(
                            items: Constants.ksaCities.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: AppCubit.get(context).orderSelectedCity,
                            style: TextStyle(
                              fontSize: FontSize.headline3Size,
                              color: ColorManager.black,
                            ),
                            hint: Text(
                              'المدينة',
                              style: TextStyle(
                                fontSize: FontSize.headline4Size,
                                color: ColorManager.lightGrey,
                              ),
                            ),
                            onChanged:(newValue) =>AppCubit.get(context).setOrderSelectedCity(newValue!),
                            underline: Container(),
                            isExpanded: true,
                          ),
                        ),
                      ),

                      SizedBox(height: SizeConfig.height * .01,),

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
                            onPressed: () async {
                              AppCubit.get(context).getPersonalImage();
                            },
                            backGroundColor: AppCubit.get(context).uploadedPersonalImageUrl.isEmpty? ColorManager.grey:ColorManager.primaryColor,
                            width: SizeConfig.height * 0.15,
                            height: SizeConfig.height * .035,
                            content:  state is UploadPersonalImageLoadingState?
                            const Center(
                              child: CircularProgressIndicator(
                                color: ColorManager.white,
                              ),
                             ): Text(
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
                            onPressed: () async {
                              AppCubit.get(context).getCarImage();
                            },
                            backGroundColor: AppCubit.get(context).uploadedCarImageUrl.isEmpty? ColorManager.grey:ColorManager.primaryColor,
                            width: SizeConfig.height * 0.15,
                            height: SizeConfig.height * .035,
                            content: state is UploadCarImageLoadingState?
                            const Center(
                              child: CircularProgressIndicator(
                                color: ColorManager.white,
                              ),
                             ):Text(
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

                      state is UploadUserInfoLoadingState?
                      const Center(
                        child: CircularProgressIndicator(color: ColorManager.primaryColor,),
                      ):
                      DefaultButton(
                        onPressed: () async {
                          if(formKey.currentState!.validate()){
                            AppCubit.get(context).uploadDriversInfo(
                                fullName: AppCubit.get(context).signUpFullNameController.text,
                                email: AppCubit.get(context).signUpEmailController.text,
                                phoneNumber: '+20${AppCubit.get(context).signUpPhoneNumberController.text}',
                                about: AppCubit.get(context).signUpAboutMeController.text,
                                address: AppCubit.get(context).signUpAddressController.text,
                                kind: 'ذكر',
                                personalImage: AppCubit.get(context).uploadedPersonalImageUrl,
                                carImage: AppCubit.get(context).uploadedCarImageUrl,
                                city: AppCubit.get(context).orderSelectedCity
                            ).then((value) {
                              Get.to(
                                  ()=> LoginScreen(),
                              );
                            });
                          }

                        },
                        backGroundColor: ColorManager.primaryColor,
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
                          Text("لدىك حساب الفعل ؟ ",
                            style: TextStyle(
                              color: ColorManager.darkGrey,
                              fontSize: SizeConfig.headline4Size,
                            ),
                          ),

                          /// sign up text button
                          InkWell(
                            onTap: () {
                              Get.to( LoginScreen());
                            },
                            child: Text(
                              "تسجيل الدخول",
                              style: TextStyle(
                                color: ColorManager.primaryColor,
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
          ),
        );
      },
    );
  }
}
