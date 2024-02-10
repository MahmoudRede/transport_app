import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transport_app/business_logic/app_states.dart';

class AppCubit extends Cubit<AppStates>{

    AppCubit() : super(InitialState());
    static AppCubit get(context) => BlocProvider.of(context);

    TextEditingController loginPhoneNumberController = TextEditingController();
    TextEditingController verifyOtpPinPutController = TextEditingController();

    TextEditingController signUpFullNameController = TextEditingController();
    TextEditingController signUpEmailController = TextEditingController();
    TextEditingController signUpPhoneNumberController = TextEditingController();
    TextEditingController signUpPasswordController = TextEditingController();
    TextEditingController signUpConfirmPasswordController = TextEditingController();
    TextEditingController signUpAboutMeController = TextEditingController();

    int? selectedValue;

    changeUserSex(value){
      selectedValue = value;
      emit(ChangeUserSexState());
    }




}