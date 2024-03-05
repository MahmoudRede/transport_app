import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:transport_app/business_logic/app_cubit.dart';
import 'package:transport_app/business_logic/app_states.dart';
import 'package:transport_app/presentation/screens/home_layout/home_layout.dart';
import 'package:transport_app/presentation/screens/home_screen/widgets/recieve_order.dart';

class QRCodeScan extends StatelessWidget {
  const QRCodeScan({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = AppCubit.get(context);
        return MobileScanner(
          controller: MobileScannerController(
            useNewCameraSelector: true,
            detectionSpeed: DetectionSpeed.noDuplicates,
            returnImage: true,
          ),
          onDetect: (capture) {
            cubit.scanQrCode(capture, context).then((value) {
              state is ScanQRCodeSuccessState ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeLayout())) : null;
            });
          },
        );
      },
    );
  }
}
