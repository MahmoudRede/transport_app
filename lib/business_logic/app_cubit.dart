import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transport_app/business_logic/app_states.dart';
import 'package:transport_app/data/models/order_model.dart';
import 'package:transport_app/presentation/screens/profile_screen/profile_screen.dart';
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
          orderImagePath = value;
          FirebaseFirestore.instance
              .collection('orders')
              .doc(CashHelper.getData(key: 'isUid'))
              .set({'pic': '$orderImagePath'}).then((value) {
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


}