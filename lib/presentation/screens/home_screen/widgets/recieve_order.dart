import 'package:flutter/material.dart';
import 'package:transport_app/presentation/widgets/default_button.dart';
import 'package:transport_app/styles/colors/color_manager.dart';

import '../../../../business_logic/app_cubit.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/default_text_field.dart';

class ReceiveOrder extends StatelessWidget {
  const ReceiveOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            DefaultTextField(
              controller: AppCubit.get(context).signUpFullNameController,
              hintText: 'Order No.',
              validator: (val) => "",
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              onTap: () {},
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * .02),
            DefaultButton(
              onPressed: () {},
              backGroundColor: ColorManager.primaryColor,
              height: MediaQuery.sizeOf(context).height * .06,
              width: double.infinity,
              content: Text(
                "Confirm",
                style: TextStyle(
                  color: ColorManager.white,
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
