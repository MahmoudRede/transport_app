import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:transport_app/business_logic/app_cubit.dart';
import 'package:transport_app/business_logic/app_states.dart';
import 'package:transport_app/presentation/screens/order_details_screen/screen/order_details_screen.dart';
import 'package:transport_app/styles/app_size_config.dart';
import 'package:transport_app/styles/colors/color_manager.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
  listener: (context, state) {},
  builder: (context, state) {
    var cubit = AppCubit.get(context);
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
             Expanded(
               child: ListView.separated(
                   itemBuilder: (context,index){
                     return GestureDetector(
                         onTap: (){
                           Get.to(
                                 () =>  OrderDetailsScreen(
                               clientName: cubit.orders[index].endClientName,
                               clientPhone: cubit.orders[index].endClientPhone,
                               clientAddress: cubit.orders[index].clientAddress,
                               city: cubit.orders[index].endClientCity,
                               phoneNumber: cubit.orders[index].clientPhone,
                               orderDate: cubit.orders[index].orderDate,
                               orderNumber: cubit.orders[index].orderId,
                               orderDetails: cubit.orders[index].orderDetails,
                             ),
                           );
                         },
                       child: Container(
                         decoration: BoxDecoration(
                           color: ColorManager.primaryColor,
                           borderRadius: BorderRadius.circular(7)
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [

                             // Image
                             Container(
                               decoration: BoxDecoration(
                                   color: ColorManager.whiteWithOpacity,
                                   borderRadius: BorderRadius.circular(7)
                               ),
                               margin: EdgeInsets.symmetric(
                                   horizontal: SizeConfig.height*.01,
                                   vertical: SizeConfig.height*.01
                               ),
                               padding: EdgeInsets.symmetric(
                                   horizontal: SizeConfig.height*.01,
                                   vertical: SizeConfig.height*.01
                               ),
                               child: Image(
                                 image: const AssetImage('assets/images/trunk.png'),
                                 height: SizeConfig.height*.1,
                                 width: SizeConfig.width*.2,
                               ),
                             ),

                             SizedBox(width: SizeConfig.height*.01,),

                             // Date of order
                              Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                  Row(
                                    children: [


                                      Text('اسم العميل :',style: TextStyle(
                                          color: ColorManager.white,
                                          fontSize: SizeConfig.height*.018,
                                          fontWeight: FontWeight.bold
                                      ),),


                                      SizedBox(width: SizeConfig.height*.01,),

                                      Text(cubit.orders[index].endClientName,style: TextStyle(
                                          color: ColorManager.white,
                                          fontSize: SizeConfig.height*.015,
                                          fontWeight: FontWeight.normal
                                      ),),


                                    ],
                                  ),

                                  Row(
                                   children: [

                                     Text('رقم الشحنه :',style: TextStyle(
                                         color: ColorManager.white,
                                         fontSize: SizeConfig.height*.018,
                                         fontWeight: FontWeight.bold
                                     ),),

                                     SizedBox(width: SizeConfig.height*.01,),

                                     Text(cubit.orders[index].orderId,style: TextStyle(
                                         color: ColorManager.white,
                                         fontSize: SizeConfig.height*.015,
                                         fontWeight: FontWeight.normal
                                     ),),


                                   ],
                                 ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                   children: [

                                     Text('تاريخ :',style: TextStyle(
                                         color: ColorManager.white,
                                         fontSize: SizeConfig.height*.018,
                                         fontWeight: FontWeight.bold
                                     ),),

                                     SizedBox(width: SizeConfig.height*.01,),

                                     Text(cubit.orders[index].orderDate,style: TextStyle(
                                         color: ColorManager.white,
                                         fontSize: SizeConfig.height*.015,
                                         fontWeight: FontWeight.normal
                                     ),),


                                   ],
                                 ),

                               ],
                              ),

                           ]
                         ),
                       ),
                     );
                    },
                   separatorBuilder: (context,index){
                     return SizedBox(height: SizeConfig.height*.02,);
                   },
                   itemCount: cubit.orders.length
               ),
             ),
          ],
        ),
      ),
    );
  },
);
  }
}
