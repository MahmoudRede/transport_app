import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transport_app/business_logic/app_states.dart';
import 'package:transport_app/presentation/screens/profile_screen/profile_screen.dart';

import '../presentation/screens/home_screen/screens/home_screen.dart';

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

    int homeIndex=0;
    void changeHomeIndex(int index){
      homeIndex = index;
      emit(ChangeHomeIndexState());
    }




}