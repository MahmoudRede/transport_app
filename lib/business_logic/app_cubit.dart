import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
 import 'package:transport_app/business_logic/app_states.dart';
import 'package:transport_app/data/models/order_model.dart';
import 'package:transport_app/data/models/user_model.dart';
import 'package:transport_app/helper/material_navigation.dart';
import 'package:transport_app/presentation/screens/Login_screen/verifiy_phone_number.dart';
import 'package:transport_app/presentation/screens/profile_screen/profile_screen.dart';
import 'package:transport_app/presentation/screens/sign_up_screen/view/sign_up_screen.dart';
import 'package:transport_app/presentation/widgets/custom_toast.dart';
import 'package:transport_app/styles/colors/color_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import '../presentation/screens/home_screen/screens/home_screen.dart';
import '../utiles/local/cash_helper.dart';

class AppCubit extends Cubit<AppStates>{

    AppCubit() : super(InitialState());
    static AppCubit get(context) => BlocProvider.of(context);

    TextEditingController loginPhoneNumberController = TextEditingController();
    TextEditingController verifyOtpPinPutController = TextEditingController();

    TextEditingController signUpFullNameController = TextEditingController();
    TextEditingController signUpEmailController = TextEditingController();
    TextEditingController signUpAddressController = TextEditingController();
    TextEditingController signUpPhoneNumberController = TextEditingController();
    TextEditingController signUpPasswordController = TextEditingController();
    TextEditingController signUpConfirmPasswordController = TextEditingController();
    TextEditingController signUpAboutMeController = TextEditingController();

    TextEditingController orderNumberController = TextEditingController();

    GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

    int? selectedValue;

    changeUserSex(value){
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

    int homeIndex=1;
    void changeHomeIndex(int index){
      homeIndex = index;
      emit(ChangeHomeIndexState());
    }

    OrderModel? orderModel;
    List<OrderModel> orders = [];
    Future<void> getOrdersFromFirebase() async {
      emit(GetOrdersLoadingState());
      await FirebaseFirestore.instance
          .collection('orders')
          .get()
          .then((value) {
        for (var element in value.docs) {
          orderModel = OrderModel.fromJson(element.data());
          orders.add(orderModel!);
        }
        debugPrint("********************** ${orders[0].clientName}" );
        emit(GetOrdersSuccessState());
      }).catchError((error) {
        emit(GetOrdersErrorState());
      });
    }

    // upload user image
    File? orderImage;

    ImageProvider order = const NetworkImage(
        'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1703015640~exp=1703016240~hmac=d32203ed9a0132b11db5f3890f4293174475e278eb0239a283c39443ae15a38b');

    var picker = ImagePicker();

    Future<void> pickOrderImage() async {
      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        orderImage = File(pickedFile.path);
        order = FileImage(orderImage!);
        firebase_storage.FirebaseStorage.instance
            .ref()
            .child('orderImage/${Uri.file(orderImage!.path).pathSegments.last}')
            .putFile(orderImage!);
        debugPrint('Path is ${pickedFile.path}');
        emit(PickOrderImageSuccessState());
      } else {
        debugPrint('No Image selected.');
        emit(PickOrderImageErrorState());
      }
    }

    String? orderImagePath;

    Future uploadOrderImage() {
      emit(UploadOrderImageLoadingState());
      return  firebase_storage.FirebaseStorage.instance
          .ref()
          .child('orderImage/${Uri.file(orderImage!.path).pathSegments.last}')
          .putFile(orderImage!)
          .then((value) {
        value.ref.getDownloadURL().then((value) {
          debugPrint('Upload Success');
          orderImagePath = orderImage!.uri.toString();
          FirebaseFirestore.instance
              .collection('receivedOrders')
              .doc(CashHelper.getData(key: 'isUid'))
              .set({'pic': '$orderImagePath',
          'id': orderNumberController.text,
          }).then((value) {
            debugPrint('Image Updates');
          });
          emit(UploadOrderImageSuccessState());
        }).catchError((error) {
          debugPrint('Error in Upload orderImage ${error.toString()}');
          emit(UploadOrderImageErrorState());
        });
      }).catchError((error) {
        debugPrint('Error in Upload orderImage ${error.toString()}');
        emit(UploadOrderImageErrorState());
      });
    }

    void launchToWhatsApp(String phoneNumber)  {
      final Uri iosWhatsapp = Uri.parse('whatsapp://wa.me/+2$phoneNumber');
      final Uri androidWhatsapp = Uri.parse('whatsapp://send?phone=+2$phoneNumber');
      if(Platform.isIOS){
         launchUrl(iosWhatsapp);
        emit(LunchToWhatsAppSuccessState());

      }else if(Platform.isAndroid){
         launchUrl(androidWhatsapp);
        emit(LunchToWhatsAppSuccessState());
      }
    }

    Future<dynamic> scanQrCode(BarcodeCapture capture, BuildContext context) async {
      final List<Barcode> barcodes = capture.barcodes;
      final Uint8List? image = capture.image;
      for (final barcode in barcodes) {
        debugPrint('Barcode found! ${barcode.rawValue}');
        orderNumberController.text = barcode.rawValue!;
      }
      emit(ScanQRCodeSuccessState());
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
    })async{

      emit(UploadUserInfoLoadingState());

      UserModel userModel=UserModel(
          userName: fullName,
          email: email,
          phone: phoneNumber,
          address: address,
          about: about,
          kind: kind,
          personalImage: personalImage,
          carImage: carImage
      );

      FirebaseFirestore.instance.
      collection('Drivers')
          .doc(phoneNumber)
          .set(userModel.toMap()).
      then((value) {

        debugPrint("Upload Driver Info Success");
        emit(UploadUserInfoSuccessState());
      }).catchError((error){

        debugPrint("Error: ${error.toString()}");
        emit(UploadUserInfoErrorState());
      });

    }



    /// Auth With Phone

    UserModel ?userModel;

    Future<void> verifyOTPCode({required int id,required String verificationId,required String phone, required BuildContext context}) async {

      emit(VerifyPhoneLoadingState());

      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: verifyOtpPinPutController.text.trim(),
      );

      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value1) {

        /// for verify user code in login
        if(id == 0){
          debugPrint('User Login In Successful');

          FirebaseFirestore.instance.collection('Drivers')
              .doc(phone)
              .get().then((value){

                userModel=UserModel.fromJson(value.data()!);

                CashHelper.saveData(key: 'userName',value: userModel!.userName);
                CashHelper.saveData(key: 'email',value: userModel!.email);
                CashHelper.saveData(key: 'phone',value: userModel!.phone);
                CashHelper.saveData(key: 'about',value: userModel!.about);
                CashHelper.saveData(key: 'address',value: userModel!.address);
                CashHelper.saveData(key: 'kind',value: userModel!.kind);
                CashHelper.saveData(key: 'carImage',value: userModel!.carImage);
                CashHelper.saveData(key: 'personalImage',value: userModel!.personalImage);

            emit(GetUserSuccessState());
          }).catchError((error){
            debugPrint("Error when get user data :================> $error");
            emit(GetUserErrorState());
          });

          customPushAndRemoveUntil(context, const HomeScreen());
        }

        emit(VerifyPhoneSuccessState());
      }).catchError((error){
        customToast(title: 'يرجى التحقق وإدخال رمز التحقق الصحيح مرة أخرى', color: ColorManager.error);
        debugPrint('Error in Verify code is ${error.toString()}');
        emit(LoginWithPhoneErrorState());
      });

    }


    firebaseSignInFunction({required BuildContext context}) async{
      if(loginFormKey.currentState!.validate()){

        emit(SignInPhoneLoadingState());

        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber:'+966${loginPhoneNumberController.text.trim()}',
          verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
            await FirebaseAuth.instance
                .signInWithCredential(phoneAuthCredential)
                .then((value) {
              debugPrint('Verify Code sent, verify you phone Number');
            },).catchError((error){
              debugPrint("Error when Sign up : ${error.toString()}");
            });
            emit(SignInPhoneSuccessState());
          },
          codeSent: (String verificationId, int? forceResendingToken) {
            debugPrint("number phone Login ======>+966 ${loginPhoneNumberController.text.trim()}");
            customPushNavigator(context, VerifyPhoneScreen(verificationId: verificationId, phoneNumber: '+966${loginPhoneNumberController.text.trim()}', id: 0,));
            emit(SignInPhoneSuccessState());
          },
          verificationFailed: (exception){
            if (exception.code == 'invalid-phone-number') {
              customToast(
                  title: 'رقم الهاتف غير صالح',
                  color: ColorManager.red
              );
            }
            debugPrint('Error when Sign up : ${exception.toString()}');
            emit(SignInPhoneErrorState());
          },
          codeAutoRetrievalTimeout: (e){
            debugPrint('Sign up Token : ${e.toString()}');
            // ShowPopUpFunctions.customToast(context: context, isTranslate: false, message: e.toString(), color: AppColor.primary);
          },
        );

      }

    }

    resendVerifyFunction ({required BuildContext context, required String phoneNumber})async{

      emit(ResendCodeLoadingState());
      resendButton = false;
      second = 31;

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+966${loginPhoneNumberController.text.trim()}",

        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) { },
        codeSent: (String verificationId, int? forceResendingToken) {
          // customPushReplacement(context, VerifyPhoneScreen(verificationId: verificationId));
          resendOtpTimer();
          emit(ResendCodeSuccessState());
        },
        verificationFailed: (e){
          //ShowPopUpFunctions.customToast(context: context, isTranslate: false, message: e.toString(), color: AppColor.primary);
          resendButton = true;
          second = 0;
          debugPrint('Error when resend verify code : ${e.toString()}');
          emit(ResendCodeErrorState());
        },
        codeAutoRetrievalTimeout: (e){
          //ShowPopUpFunctions.customToast(context: context, isTranslate: false, message: e.toString(), color: AppColor.primary);
          debugPrint('Error when resend verify code : ${e.toString()}');
        },
      );

    }

    int second = 0;
    Timer? secondTimer;
    bool resendButton = false;


    /// Counter for resend code
    resendOtpTimer(){
      second = 31;
      secondTimer = Timer.periodic(const Duration(seconds: 1), (_){
        if(second>0){
          --second;
          emit(ResendCodeTimerState());
        }
        else{
          resendButton = true;
          second = 0;
          secondTimer!.cancel();
          emit(ResendCodeTimerFinishedState());
        }
      });
    }


    Future<void> checkUserId({required  BuildContext context, required String phone})async{

      emit(CheckUserIdLoadingState());

      await FirebaseFirestore.instance.collection('Drivers')
          .doc("+966${phone}")
          .get().then((value) {

            print(value.data()!.isEmpty);
          debugPrint("User Is Already Login ");
          AppCubit.get(context).firebaseSignInFunction(context: context);

          emit(CheckUserIdSuccessState());
      }).catchError((error){
        debugPrint("Error when get user data :================> $error");
        customToast(title: 'يجب تسجيل البيانات اولا', color: ColorManager.error);
        customPushNavigator(context, const SignUpScreen());
        loginPhoneNumberController.clear();
        emit(CheckUserIdErrorState());
      });

    }


}