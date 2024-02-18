import 'package:flutter/material.dart';
import 'package:transport_app/styles/app_size_config.dart';
import 'package:transport_app/styles/colors/color_manager.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// order name
            Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  Row(

                    children: [
                    Text(
                      "اسم الشحنة: ",
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            color: ColorManager.primaryColor,
                          ),
                    ),
                    Text(
                      "توصيل منتجات العناية بالشعر",
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: SizeConfig.height*.02 ,

                        color: ColorManager.primaryColor,
                          ),
                    ),
                  ]),
                  const Divider(),
                  SizedBox(height:  SizeConfig.height * 0.01,),
                  Row(

                      children: [
                        Text(
                          "رقم الشحنة: ",
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            color: ColorManager.primaryColor,
                          ),
                        ),
                        Text(
                          "5521364",
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontSize: SizeConfig.height*.02 ,
                            color: ColorManager.primaryColor,
                          ),
                        ),
                      ]),
                  const Divider(),
                  SizedBox(height:  SizeConfig.height * 0.01,),
                  Row(

                      children: [
                        Text(
                          "العنوان: ",
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            color: ColorManager.primaryColor,
                          ),
                        ),
                        Text(
                          "الرياض - المملكة العربية السعودية",
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontSize: SizeConfig.height*.02 ,
                            color: ColorManager.primaryColor,
                          ),
                        ),
                      ]),
                  const Divider(),
                  SizedBox(height:  SizeConfig.height * 0.01,),
                  Row(

                      children: [
                        Text(
                          "رقم الهاتف: ",
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            color: ColorManager.primaryColor,
                          ),
                        ),
                        Text(
                          "201554583937+",
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontSize: SizeConfig.height*.02 ,
                            color: ColorManager.primaryColor,
                          ),
                        ),

                      ],
                  ),
                  const Divider(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
