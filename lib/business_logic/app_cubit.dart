import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transport_app/business_logic/app_states.dart';
import 'package:transport_app/data/models/order_model.dart';
import 'package:transport_app/data/models/user_model.dart';
import 'package:transport_app/helper/material_navigation.dart';
import 'package:transport_app/helper/shared_preference.dart';
import 'package:transport_app/presentation/screens/Login_screen/verifiy_phone_number.dart';
import 'package:transport_app/presentation/screens/home_layout/home_layout.dart';
import 'package:transport_app/presentation/screens/profile_screen/profile_screen.dart';
import 'package:transport_app/presentation/screens/sign_up_screen/view/sign_up_screen.dart';
import 'package:transport_app/presentation/widgets/custom_toast.dart';
import 'package:transport_app/styles/colors/color_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import '../presentation/screens/home_screen/screens/home_screen.dart';
import '../utiles/local/cash_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  TextEditingController loginPhoneNumberController = TextEditingController();
  TextEditingController verifyOtpPinPutController = TextEditingController();

  TextEditingController signUpFullNameController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpAddressController = TextEditingController();
  TextEditingController signUpPhoneNumberController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpConfirmPasswordController =
      TextEditingController();
  TextEditingController signUpAboutMeController = TextEditingController();

  TextEditingController orderNumberController = TextEditingController();


  int? selectedValue;

  changeUserSex(value) {
    selectedValue = value;
    emit(ChangeUserSexState());
  }

  void setIndex(int value) {
    currentIndex = value;
    emit(SetCurrentIndexStates());
  }

  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const ProfileScreen(),
  ];

  int homeIndex = 1;

  void changeHomeIndex(int index) {
    homeIndex = index;
    emit(ChangeHomeIndexState());
  }

  OrderModel? orderModel;
  List<OrderModel> orders = [];

  /// get orders depending on user city
  Future<void> getOrdersFromFirebase() async {
    emit(GetOrdersLoadingState());
    await FirebaseFirestore.instance

        /// TODO replace the client id with his city
        .collection('orders')
        // .where("endClientQuarter",
        //     isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      for (var element in value.docs) {
        orderModel = OrderModel.fromJson(element.data());
        orders.add(orderModel!);
      }
      debugPrint("********************** ${orders[0].clientName}");
      emit(GetOrdersSuccessState());
    }).catchError((error) {
      emit(GetOrdersErrorState());
    });
  }

  /// upload received orders

  /// TODO Add client details with the received order
  Future<void> uploadReceivedOrders(String orderId) async {
    emit(UploadReceivedOrderLoadingState());
    await FirebaseFirestore.instance
        .collection('receivedOrders')
        .doc(orderId)
        .set({
      'orderId': orderId,
      'clientName': "",
      'clientPhoneNumber': "",
      'clientAddress': "",
      'clientQuarter': "",
      'clientCity': "",
    }).then((value) {
      emit(UploadReceivedOrderSuccessState());
    }).catchError((error) {
      emit(UploadReceivedOrderErrorState());
    });
  }

  /// update order status
  Future<void> updateOrderState(String orderId) async {
    emit(UpdateOrderStateLoadingState());
    await FirebaseFirestore.instance.collection('orders').doc(orderId).update({
      'step': 0,
    }).then((value) {
      emit(UpdateOrderStateSuccessState());
    }).catchError((error) {
      emit(UpdateOrderStateErrorState());
    });
  }

  /// redirect to whatsapp
  void launchToWhatsApp(String phoneNumber) {
    final Uri iosWhatsapp = Uri.parse('whatsapp://wa.me/+966$phoneNumber');
    final Uri androidWhatsapp =
        Uri.parse('whatsapp://send?phone=+966$phoneNumber');
    if (Platform.isIOS) {
      launchUrl(iosWhatsapp);
      emit(LunchToWhatsAppSuccessState());
    } else if (Platform.isAndroid) {
      launchUrl(androidWhatsapp);
      emit(LunchToWhatsAppSuccessState());
    }
  }

  Future<void> uploadDriversInfo({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String about,
    required String address,
    required String kind,
    required String personalImage,
    required String carImage,
    required String city,
  }) async {
    emit(UploadUserInfoLoadingState());

    UserModel userModel = UserModel(
        userName: fullName,
        email: email,
        phone: phoneNumber,
        address: address,
        about: about,
        kind: kind,
        personalImage: personalImage,
        city: city,
        carImage: carImage);

    FirebaseFirestore.instance
        .collection('Drivers')
        .doc(phoneNumber)
        .set(userModel.toMap())
        .then((value) {
      debugPrint("Upload Driver Info Success");
      emit(UploadUserInfoSuccessState());
    }).catchError((error) {
      debugPrint("Error: ${error.toString()}");
      emit(UploadUserInfoErrorState());
    });
  }

  /// Auth With Phone

  UserModel? userModel;

  Future<void> verifyOTPCode(
      {required int id,
      required String verificationId,
      required String phone,
      required BuildContext context}) async {
    emit(VerifyPhoneLoadingState());

    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: verifyOtpPinPutController.text.trim(),
    );

    await FirebaseAuth.instance.signInWithCredential(credential).then((value1) {
      /// for verify user code in login
      if (id == 0) {
        debugPrint('User Login In Successful');

        FirebaseFirestore.instance
            .collection('Drivers')
            .doc(phone)
            .get()
            .then((value) {

          userModel = UserModel.fromJson(value.data()!);

          UserDataFromStorage.setDriverUserName(userModel!.userName);
          UserDataFromStorage.setDriverEmail(userModel!.email);
          UserDataFromStorage.setDriverAbout(userModel!.about);
          UserDataFromStorage.setDriverKind(userModel!.kind);
          UserDataFromStorage.setDriverPhone(userModel!.phone);
          UserDataFromStorage.setDriverCarImage(userModel!.carImage);
          UserDataFromStorage.setDriverCity(userModel!.city);
          UserDataFromStorage.setDriverPersonalImage(userModel!.personalImage);

          emit(GetUserSuccessState());
        }).catchError((error) {
          debugPrint("Error when get user data :================> $error");
          emit(GetUserErrorState());
        });

        customPushAndRemoveUntil(context, const HomeLayout());
      }

      emit(VerifyPhoneSuccessState());
    }).catchError((error) {
      customToast(
          title: 'يرجى التحقق وإدخال رمز التحقق الصحيح مرة أخرى',
          color: ColorManager.error);
      debugPrint('Error in Verify code is ${error.toString()}');
      emit(LoginWithPhoneErrorState());
    });
  }

  firebaseSignInFunction({required BuildContext context}) async {

    emit(SignInPhoneLoadingState());

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+20${loginPhoneNumberController.text.trim()}',
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        await FirebaseAuth.instance
            .signInWithCredential(phoneAuthCredential)
            .then(
              (value) {
            debugPrint('Verify Code sent, verify you phone Number');
          },
        ).catchError((error) {
          debugPrint("Error when Sign up : ${error.toString()}");
        });
        emit(SignInPhoneSuccessState());
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        debugPrint(
            "number phone Login ======>+20 ${loginPhoneNumberController.text.trim()}");
        customPushNavigator(
            context,
            VerifyPhoneScreen(
              verificationId: verificationId,
              phoneNumber: '+20${loginPhoneNumberController.text.trim()}',
              id: 0,
            ));
        emit(SignInPhoneSuccessState());
      },
      verificationFailed: (exception) {
        if (exception.code == 'invalid-phone-number') {
          customToast(title: 'رقم الهاتف غير صالح', color: ColorManager.red);
        }
        debugPrint('Error when Sign up : ${exception.toString()}');
        emit(SignInPhoneErrorState());
      },
      codeAutoRetrievalTimeout: (e) {
        debugPrint('Sign up Token : ${e.toString()}');
        // ShowPopUpFunctions.customToast(context: context, isTranslate: false, message: e.toString(), color: AppColor.primary);
      },
    );
  }

  resendVerifyFunction(
      {required BuildContext context, required String phoneNumber}) async {
    emit(ResendCodeLoadingState());
    resendButton = false;
    second = 31;

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+20${loginPhoneNumberController.text.trim()}",
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
      codeSent: (String verificationId, int? forceResendingToken) {
        PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: verifyOtpPinPutController.text.trim(),
        );
        // customPushReplacement(context, VerifyPhoneScreen(verificationId: verificationId));
        resendOtpTimer();
        emit(ResendCodeSuccessState());
      },
      verificationFailed: (e) {
        //ShowPopUpFunctions.customToast(context: context, isTranslate: false, message: e.toString(), color: AppColor.primary);
        resendButton = true;
        second = 0;
        debugPrint('Error when resend verify code : ${e.toString()}');
        emit(ResendCodeErrorState());
      },
      codeAutoRetrievalTimeout: (e) {
        //ShowPopUpFunctions.customToast(context: context, isTranslate: false, message: e.toString(), color: AppColor.primary);
        debugPrint('Error when resend verify code : ${e.toString()}');
      },
    );
  }

  int second = 0;
  Timer? secondTimer;
  bool resendButton = false;

  /// Counter for resend code
  resendOtpTimer() {
    second = 31;
    secondTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (second > 0) {
        --second;
        emit(ResendCodeTimerState());
      } else {
        resendButton = true;
        second = 0;
        secondTimer!.cancel();
        emit(ResendCodeTimerFinishedState());
      }
    });
  }

  Future<void> checkUserId(
      {required BuildContext context, required String phone}) async {
    emit(CheckUserIdLoadingState());

    await FirebaseFirestore.instance
        .collection('Drivers')
        .doc("+20$phone")
        .get()
        .then((value) {
      debugPrint("${value.data()!.isEmpty}");
      debugPrint("User Is Already Login ");
      AppCubit.get(context).firebaseSignInFunction(context: context);

      emit(CheckUserIdSuccessState());
    }).catchError((error) {
      debugPrint("Error when get user data :================> $error");
      customToast(title: 'يجب تسجيل البيانات اولا', color: ColorManager.error);
      customPushNavigator(context,  SignUpScreen());
      loginPhoneNumberController.clear();
      emit(CheckUserIdErrorState());
    });
  }


  var orderSelectedCity = 'الرياض';

  void setOrderSelectedCity(String value) {
    orderSelectedCity = value;
    emit(SetOrderSelectedCityStates());
  }


  File? uploadedCarImage;
  String uploadedCarImageUrl = "";
  var imagePicker2 = ImagePicker();

  Future <void> getCarImage() async {
    emit(UploadCarImageLoadingState());
    final pickedFile = await imagePicker2.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      uploadedCarImage = File(pickedFile.path);
      FirebaseStorage.instance.ref()
          .child('CarImages/${Uri.file(uploadedCarImage!.path)
          .pathSegments.last}').putFile(uploadedCarImage!).then((p0){
        p0.ref.getDownloadURL().then((value) {
          uploadedCarImageUrl = value;
          emit(UploadCarImageSuccessState());
        });
      });
    } else {
      debugPrint('No Image selected.');
      emit(UploadCarImageErrorState());
    }
  }

  File? uploadedPersonalImage;
  String uploadedPersonalImageUrl = "";
  var imagePicker = ImagePicker();

  Future <void> getPersonalImage() async {
    emit(UploadPersonalImageLoadingState());
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      uploadedPersonalImage = File(pickedFile.path);
      FirebaseStorage.instance.ref()
          .child('CommercialRegisterImages/${Uri.file(uploadedPersonalImage!.path)
          .pathSegments.last}').putFile(uploadedPersonalImage!).then((p0){
        p0.ref.getDownloadURL().then((value) {
          uploadedPersonalImageUrl = value;
          emit(UploadPersonalImageSuccessState());
        });
      });
    } else {
      debugPrint('No Image selected.');
      emit(UploadPersonalImageErrorState());
    }
  }

}
