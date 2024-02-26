import 'package:flutter/material.dart';
import 'package:transport_app/business_logic/app_cubit.dart';
import 'package:transport_app/presentation/screens/order_details_screen/Widgets/order_details_row.dart';
import 'package:transport_app/styles/app_size_config.dart';
import 'package:transport_app/styles/colors/color_manager.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String clientName;
  final String clientPhone;
  final String clientAddress;
  final String city;
  final String phoneNumber;
  final String orderDate;
  final String orderNumber;

  const OrderDetailsScreen(
      {required this.clientName,
      required this.clientPhone,
      required this.clientAddress,
      required this.city,
      required this.phoneNumber,
      required this.orderDate,
      required this.orderNumber,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
        shape: const Border(
          bottom: BorderSide(color: ColorManager.white, width: 1.0),
        ),
        elevation: 0.0,
        title: const Text(
          "تفاصيل الشحنة",
          style: TextStyle(color: ColorManager.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// order name
              Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "اسم العميل",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontSize: SizeConfig.headline3Size ,
                            color: ColorManager.primaryColor,
                              ),
                    ),
                    SizedBox(
                      height: SizeConfig.height * 0.01,
                    ),
                    OrderDetailsRow(
                        height: SizeConfig.height * .06,
                        hasImage: false,
                        content: clientName),
                    SizedBox(
                      height: SizeConfig.height * 0.02,
                    ),
                    Text(
                      "رقم الشحنة",
                      style:
                      Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: SizeConfig.headline3Size ,
                        color: ColorManager.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.height * 0.01,
                    ),
                    OrderDetailsRow(
                        height: SizeConfig.height * .06,
                        hasImage: false,
                        content: orderNumber),
                    SizedBox(
                      height: SizeConfig.height * 0.02,
                    ),
                    Text(
                      "تاريخ الشحنة",
                      style:
                      Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: SizeConfig.headline3Size ,
                        color: ColorManager.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.height * 0.01,
                    ),
                    OrderDetailsRow(
                        height: SizeConfig.height * .06,
                        hasImage: false,
                        content: orderDate),
                    SizedBox(
                      height: SizeConfig.height * 0.02,
                    ),
                    Text(
                      "المدينة",
                      style:
                      Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: SizeConfig.headline3Size ,
                        color: ColorManager.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.height * 0.01,
                    ),
                    OrderDetailsRow(
                        height: SizeConfig.height * .06,
                        hasImage: false,
                        content: city),
                    SizedBox(
                      height: SizeConfig.height * 0.02,
                    ),
                    Text(
                      "العنوان",
                      style:
                      Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: SizeConfig.headline3Size ,
                        color: ColorManager.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.height * 0.01,
                    ),
                    OrderDetailsRow(
                        height: SizeConfig.height * .06,
                        hasImage: false,
                        content: clientAddress),
                    SizedBox(
                      height: SizeConfig.height * 0.02,
                    ),
                    Text(
                      "رقم الجوال",
                      style:
                      Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: SizeConfig.headline3Size ,
                        color: ColorManager.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.height * 0.01,
                    ),
                    OrderDetailsRow(
                        height: SizeConfig.height * .06,
                        hasImage: false,
                        content: phoneNumber),
                    SizedBox(
                      height: SizeConfig.height * 0.02,
                    ),
                    Text(
                      "رقم جوال العميل",
                      style:
                      Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: SizeConfig.headline3Size ,

                        color: ColorManager.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.height * 0.01,
                    ),
                    OrderDetailsRow(
                        height: SizeConfig.height * .06,
                        hasImage: true,
                        onTap: () {
                          AppCubit.get(context).launchToWhatsApp(clientPhone);
                        },
                        content: clientPhone),
                    SizedBox(
                      height: SizeConfig.height * 0.02,
                    ),
                    Text(
                      "تفاصيل الشحنة",
                      style:
                      Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: SizeConfig.headline3Size ,
                        color: ColorManager.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.height * 0.01,
                    ),
                    OrderDetailsRow(
                        height: SizeConfig.height * .25,
                        hasImage: false,
                        content: ""),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
