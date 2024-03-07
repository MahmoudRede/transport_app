
import 'package:flutter/material.dart';
import 'package:transport_app/helper/shared_preference.dart';
import 'package:transport_app/presentation/widgets/default_text_field.dart';
import 'package:transport_app/styles/colors/color_manager.dart';

class EditProfileScreen extends StatelessWidget {
  static var nameController = TextEditingController();
  static var phoneController = TextEditingController();
  static var emailController = TextEditingController();
  static var cityController = TextEditingController();
  static var passController = TextEditingController();

  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .06,
          ),
          Text(
            'البروفيل',
            style: TextStyle(
                color: ColorManager.primaryColor,
                fontSize: MediaQuery.sizeOf(context).height * .027,
                ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .005,
          ),
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).height * .02),
              decoration: const BoxDecoration(

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .01,
                    ),



                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .05,
                    ),

                    // name
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).height * .024,
                      ),
                      child: Text(
                        'الاسم كامل',
                        style: TextStyle(
                          color: ColorManager.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.sizeOf(context).height * .017,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).height * .02,
                      ),
                      child: DefaultTextField(
                        enable: false,
                        controller: nameController,
                        hintText: UserDataFromStorage.driverUserName,
                        validator: (value) {  },
                        onTap: (){},
                        keyboardType:TextInputType.name ,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .02,
                    ),

                    // phone
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).height * .024,
                      ),
                      child: Text(
                        'رقم الهاتف',
                        style: TextStyle(
                          color: ColorManager.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.sizeOf(context).height * .017,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).height * .02,
                      ),
                      child:  DefaultTextField(
                        enable: false,
                        controller: phoneController,
                        hintText: UserDataFromStorage.driverPhone,
                        validator: (value) {},
                        onTap: (){},
                        keyboardType:TextInputType.phone ,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .02,
                    ),

                    // email
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).height * .024,
                      ),
                      child: Text(
                        'البريد الالكتروني',
                        style: TextStyle(
                          color: ColorManager.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.sizeOf(context).height * .017,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).height * .02,
                      ),
                      child:  DefaultTextField(
                        enable: false,
                        controller: emailController,
                        hintText: UserDataFromStorage.driverEmail,
                        validator: (value) {},
                        onTap: (){},
                        keyboardType:TextInputType.emailAddress ,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .02,
                    ),

                    // kind
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.sizeOf(context).height * .024,
                            ),
                            child: Text(
                              'النوع',
                              style: TextStyle(
                                color: ColorManager.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: MediaQuery.sizeOf(context).height * .017,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .02,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.sizeOf(context).height * .02,
                            ),
                            child:  DefaultTextField(
                              enable: false,
                              controller: emailController,
                              hintText: UserDataFromStorage.driverKind,
                              validator: (value) {},
                              onTap: (){},
                              keyboardType:TextInputType.text ,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                        ],
                      ),

                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .02,
                    ),

                    // About
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.sizeOf(context).height * .024,
                          ),
                          child: Text(
                            'نبذه عني',
                            style: TextStyle(
                              color: ColorManager.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.sizeOf(context).height * .017,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .02,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.sizeOf(context).height * .02,
                          ),
                          child:  DefaultTextField(
                            enable: false,
                            controller: emailController,
                            hintText: UserDataFromStorage.driverAbout,
                            validator: (value) {},
                            onTap: (){},
                            keyboardType:TextInputType.text ,
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .02,
                    ),

                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .02,
                    ),

                    // City
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.sizeOf(context).height * .024,
                          ),
                          child: Text(
                            'المدينة',
                            style: TextStyle(
                              color: ColorManager.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.sizeOf(context).height * .017,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .02,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.sizeOf(context).height * .02,
                          ),
                          child:  DefaultTextField(
                            enable: false,
                            controller: emailController,
                            hintText: UserDataFromStorage.driverCity,
                            validator: (value) {},
                            onTap: (){},
                            keyboardType:TextInputType.text ,
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .02,
                    ),



                    // // save button
                    // Padding(
                    //   padding: EdgeInsets.symmetric(
                    //     horizontal: MediaQuery.sizeOf(context).height * .02,
                    //   ),
                    //   child: DefaultButton(
                    //     onPressed: () {},
                    //     backGroundColor: ColorManager.secondaryColor,
                    //     height: MediaQuery.sizeOf(context).height * .06,
                    //     width: double.infinity,
                    //     content: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Text('حفظ',
                    //             style: TextStyle(
                    //               color: ColorManager.white,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize:
                    //                   MediaQuery.sizeOf(context).height *
                    //                       .025,
                    //             )),
                    //         const Image(
                    //             image: AssetImage(
                    //           'assets/images/arrow.png',
                    //         )),
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    // SizedBox(
                    //   height: MediaQuery.sizeOf(context).height * .02,
                    // ),
                    //
                    // /// Delete Account
                    // Padding(
                    //   padding: EdgeInsets.symmetric(
                    //     horizontal: MediaQuery.sizeOf(context).height * .02,
                    //   ),
                    //   child: DefaultButton(
                    //     onPressed: () {
                    //       // AppCubit.get(context).deleteUser(context: context);
                    //     },
                    //     backGroundColor: ColorManager.red,
                    //     height: MediaQuery.sizeOf(context).height * .06,
                    //     width: double.infinity,
                    //     content: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Text('حذف الحساب',
                    //             style: TextStyle(
                    //               color: ColorManager.white,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize:
                    //                   MediaQuery.sizeOf(context).height *
                    //                       .025,
                    //             )),
                    //         const Image(
                    //           image: AssetImage(
                    //             'assets/images/arrow.png',
                    //           ),
                    //           color: ColorManager.red,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
