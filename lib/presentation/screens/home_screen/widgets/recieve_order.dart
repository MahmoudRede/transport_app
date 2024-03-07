import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transport_app/business_logic/app_states.dart';
import 'package:transport_app/presentation/screens/home_screen/widgets/qr_code_scan.dart';
import 'package:transport_app/presentation/widgets/custom_toast.dart';
import 'package:transport_app/presentation/widgets/default_button.dart';
import 'package:transport_app/styles/app_size_config.dart';
import 'package:transport_app/styles/colors/color_manager.dart';
import 'package:transport_app/styles/theme_manager/font_manager.dart';
import '../../../../business_logic/app_cubit.dart';
import '../../../widgets/default_text_field.dart';

class ReceiveOrder extends StatefulWidget {
  const ReceiveOrder({super.key});

  @override
  State<ReceiveOrder> createState() => _ReceiveOrderState();
}

class _ReceiveOrderState extends State<ReceiveOrder> {
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
                    hintText: cubit.orderNumberController.text,
                    enable: false,
                    validator: (val) => "",
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onTap: () {},
                  ),
                  SizedBox(height: SizeConfig.height * .02),
                  DefaultButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const QRCodeScan();
                          },
                        ),
                      );
                    },
                    backGroundColor: ColorManager.primaryColor,
                    height: MediaQuery.sizeOf(context).height * .06,
                    width: double.infinity,
                    content: const Text(
                      "امسح ال QR Code",
                      style: TextStyle(
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.height * .02),
                  state is UpdateOrderStateLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.primaryColor,
                          ),
                        )
                      : DefaultButton(
                          onPressed: () {
                            if (cubit.orderNumberController.text.isEmpty) {
                              customToast(
                                title: "يرجى ادخال رقم الشحنة",
                                color: ColorManager.error,
                              );
                            } else {
                              cubit.updateOrderState(
                                  cubit.orderNumberController.text).then((value) {
                                cubit.uploadReceivedOrders(cubit.orderNumberController.text);
                                cubit.orderNumberController.clear();
                                customToast(title: "تم استلام الشحنة بنجاح", color: Colors.green,);
                              });
                            }
                          },
                          backGroundColor: ColorManager.primaryColor,
                          height: MediaQuery.sizeOf(context).height * .06,
                          width: double.infinity,
                          content: const Text("تأكيد الاستلام",
                              style: TextStyle(
                                color: ColorManager.white,
                              ),
                          ),
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
