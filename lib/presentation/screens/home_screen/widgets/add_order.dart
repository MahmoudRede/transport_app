import 'package:flutter/material.dart';
import 'package:transport_app/styles/colors/color_manager.dart';

import '../../../../business_logic/app_cubit.dart';
import '../../../widgets/default_text_field.dart';

class AddOrderWidget extends StatelessWidget {
  const AddOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * .01),
            Container(
              height: MediaQuery.sizeOf(context).height * .06,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: ColorManager.primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Order Details",
                    style: TextStyle(
                      color: ColorManager.white,
                      fontSize: MediaQuery.sizeOf(context).height * .02,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * .03),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  DefaultTextField(
                    controller: AppCubit.get(context).signUpFullNameController,
                    hintText: 'Product Name',
                    validator: (val) => "",
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onTap: () {},
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * .03),
                  DefaultTextField(
                    controller: AppCubit.get(context).signUpFullNameController,
                    hintText: 'Product Id',
                    validator: (val) => "",
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onTap: () {},
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * .03),
                  DefaultTextField(
                    controller: AppCubit.get(context).signUpFullNameController,
                    hintText: 'Product ',
                    validator: (val) => "",
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onTap: () {},
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * .03),
                  DefaultTextField(
                    controller: AppCubit.get(context).signUpFullNameController,
                    hintText: 'Product ',
                    validator: (val) => "",
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onTap: () {},
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * .03),
                  DefaultTextField(
                    controller: AppCubit.get(context).signUpFullNameController,
                    hintText: 'Product ',
                    validator: (val) => "",
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onTap: () {},
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * .03),
                  DefaultTextField(
                    controller: AppCubit.get(context).signUpFullNameController,
                    hintText: 'Product ',
                    validator: (val) => "",
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * .01),
            Container(
              height: MediaQuery.sizeOf(context).height * .06,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: ColorManager.primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Client Details",
                    style: TextStyle(
                      color: ColorManager.white,
                      fontSize: MediaQuery.sizeOf(context).height * .02,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * .03),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  DefaultTextField(
                    controller: AppCubit.get(context).signUpFullNameController,
                    hintText: 'Client Name',
                    validator: (val) => "",
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onTap: () {},
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * .03),
                  DefaultTextField(
                    controller: AppCubit.get(context).signUpFullNameController,
                    hintText: 'Phone Number',
                    validator: (val) => "",
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onTap: () {},
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * .03),
                  DefaultTextField(
                    controller: AppCubit.get(context).signUpFullNameController,
                    hintText: 'Address ',
                    validator: (val) => "",
                    maxLines: 5,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onTap: () {},
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * .03),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
