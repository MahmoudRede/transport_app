import 'package:flutter/material.dart';
import 'package:transport_app/styles/colors/color_manager.dart';
import '../../../../styles/app_size_config.dart';

class OrderDetailsRow extends StatelessWidget {
   double height;
  String content;
   bool hasImage=false;
   void Function()? onTap;
    OrderDetailsRow({ this.onTap,required this.height, required this.hasImage,required this.content,super.key});

  @override
  Widget build(BuildContext context) {
    return hasImage==true? InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorManager.white,
          boxShadow: [
            BoxShadow(
              color: ColorManager.grey,
              blurRadius: 1,
              offset: const Offset(0, 1),
              spreadRadius: 1,
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [

              Text(
                content,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: SizeConfig.height * .02,
                      color: ColorManager.primaryColor,
                    ),
              ),
              const Spacer(),
              Image(image: const AssetImage("assets/images/whatsapp.png",),
                 width: SizeConfig.width * .08,
              )
            ],
          ),
        ),
      ),
    ) :Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorManager.white,
          boxShadow: [
            BoxShadow(
              color: ColorManager.grey,
              blurRadius: 1,
              offset: const Offset(0, 1),
              spreadRadius: 1,
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children: [
            Text(
              content,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: SizeConfig.height * .02,
                color: ColorManager.primaryColor,
                overflow:  TextOverflow.clip,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
