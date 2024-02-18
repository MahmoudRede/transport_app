import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport_app/presentation/screens/home_screen/widgets/order_widget.dart';
import 'package:transport_app/presentation/screens/order_details_screen/screen/order_details_screen.dart';
import 'package:transport_app/styles/app_size_config.dart';

class AddOrderWidget extends StatelessWidget {
  const AddOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ListView.separated(
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(

                  child: const OrderWidget());
            },
            separatorBuilder: (context, index) => SizedBox(
              height: SizeConfig.height * 0.01,
            ),
          )),
    );
  }
}
