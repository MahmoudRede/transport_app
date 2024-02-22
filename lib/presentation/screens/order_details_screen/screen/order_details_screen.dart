import 'package:flutter/material.dart';
import 'package:transport_app/presentation/screens/order_details_screen/Widgets/order_details_row.dart';
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
                  OrderDetailsRow(hasImage: false,  title: "اسم الشحنة: ", content: "توصيل منتجات العناية بالشعر"),
                  SizedBox(height:  SizeConfig.height * 0.02,),
                  OrderDetailsRow(hasImage: false,  title: "رقم الشحنة: ", content:  "5521364"),
                  SizedBox(height:  SizeConfig.height * 0.02,),
                  OrderDetailsRow(hasImage: false,  title: "العنوان: ", content:  "الرياض - المملكة العربية السعودية"),
                  SizedBox(height:  SizeConfig.height * 0.02,),
                  OrderDetailsRow(hasImage: false,  title: "رقم الجوال: ", content:  "201554583937+"),
                  SizedBox(height:  SizeConfig.height * 0.02,),
                  OrderDetailsRow(hasImage: true ,onTap: (){
                    debugPrint("whatsapp");
                  }, title: "رقم جوال العميل: ", content:  "201554583937+"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
