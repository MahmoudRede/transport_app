import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:transport_app/business_logic/app_cubit.dart';
import 'package:transport_app/business_logic/app_states.dart';
import 'package:transport_app/presentation/screens/home_layout/home_layout.dart';
import 'package:transport_app/styles/app_size_config.dart';
import 'package:transport_app/styles/colors/color_manager.dart';

class QRCodeScan extends StatefulWidget {
  const QRCodeScan({super.key});

  @override
  State<QRCodeScan> createState() => _QRCodeScanState();
}

class _QRCodeScanState extends State<QRCodeScan> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = AppCubit.get(context);
        return MobileScanner(
          overlay: Center(
            child: Container(
              height: SizeConfig.height * .3,
              width: SizeConfig.height * .3,
               decoration: BoxDecoration(
                 border: Border.all(
                   color: ColorManager.white,
                   width: 4,
                   strokeAlign: BorderSide.strokeAlignOutside,
                 ),
                 borderRadius: BorderRadius.circular(25),
                 ),

               ),
          ),
          controller: MobileScannerController(

            useNewCameraSelector: true,
            detectionSpeed: DetectionSpeed.noDuplicates,
            returnImage: true,
          ),
          onDetect: (capture) {
            setState(() {
              final List<Barcode> barcodes = capture.barcodes;
              // final Uint8List? image = capture.image;
              for (final barcode in barcodes) {
                debugPrint('Barcode found! ${barcode.rawValue}');
                cubit.orderNumberController.text = barcode.rawValue!;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeLayout(),
                  ),
                );
              }
            },
            );
          },
        );
      },
    );
  }
}
