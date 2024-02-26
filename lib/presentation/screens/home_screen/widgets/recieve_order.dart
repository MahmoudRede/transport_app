import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transport_app/business_logic/app_states.dart';
import 'package:transport_app/presentation/widgets/default_button.dart';
import 'package:transport_app/styles/app_size_config.dart';
import 'package:transport_app/styles/colors/color_manager.dart';
import 'package:transport_app/styles/theme_manager/font_manager.dart';
import '../../../../business_logic/app_cubit.dart';
import '../../../widgets/default_text_field.dart';

class ReceiveOrder extends StatelessWidget {
  const ReceiveOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
  listener: (context, state) {},
  builder: (context, state) {
    var cubit = AppCubit.get(context);
    return SizedBox(
      height: SizeConfig.height,
      width: SizeConfig.width,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "رقم الشحنة",
                  style: TextStyle(
                      fontSize: FontSize.headline2Size,
                      color: ColorManager.primaryColor),
                ),
              ),
              SizedBox(height: SizeConfig.height * .01),
              DefaultTextField(
                controller: cubit.orderNumberController,
                hintText: 'أدخل رقم الشحنة',
                validator: (val) => "",
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onTap: () {},
              ),
              SizedBox(height: SizeConfig.height * .02),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "أرفق صورة الشحنة",
                  style: TextStyle(
                      fontSize: FontSize.headline2Size,
                      color: ColorManager.primaryColor),
                 ),
              ),
               Container(
                  margin: EdgeInsets.all(SizeConfig.height * .005),
                  height: SizeConfig.height * .4,
                  width: SizeConfig.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorManager.gray),
                  ),
                  child: InkWell(
                    onTap: () {
                      cubit.pickOrderImage().then((value) {
                        cubit.uploadOrderImage();
                      });
                    },
                    child:
                    state is UploadOrderImageLoadingState?
                      const Center(child: CircularProgressIndicator(color:  ColorManager.primaryColor,),):
                    state is UploadOrderImageSuccessState?
                    Image.file(File(cubit.orderImage!.path))
                        : Center(
                        child: Icon(
                      Icons.upload,
                      color: ColorManager.primaryColor,
                      size: SizeConfig.height * .05,
                    )),
                  ),
               ),
              SizedBox(height: SizeConfig.height * .02),

              DefaultButton(
                onPressed: () {},
                backGroundColor: ColorManager.primaryColor,
                height: MediaQuery.sizeOf(context).height * .06,
                width: double.infinity,
                content: const Text("تأكيد الاستلام",
                    style: TextStyle(
                      color: ColorManager.white,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
