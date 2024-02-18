import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:transport_app/styles/app_size_config.dart';
import 'package:transport_app/styles/colors/color_manager.dart';

import '../../order_details_screen/screen/order_details_screen.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:  () {
        Get.to(
              () => const OrderDetailsScreen(),
        );
      },
      child: Container(
        height: SizeConfig.height * .15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorManager.primaryColor,
          boxShadow: [
            BoxShadow(
              color: ColorManager.grey.withOpacity(0.5),
              blurRadius: 3,
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text("15423789", style: TextStyle(
                color: ColorManager.white,
              ),
              ),
               Text(" :رقم الشحنة", style: TextStyle(
                 color: ColorManager.white,
                 fontSize: SizeConfig.headline3Size,
               ),
               ),

            ]
          )
        )
      ),
    );
  }
}
