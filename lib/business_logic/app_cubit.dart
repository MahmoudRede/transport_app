import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transport_app/business_logic/app_states.dart';

class AppCubit extends Cubit<AppStates>{

    AppCubit() : super(InitialState());
    static AppCubit get(context) => BlocProvider.of(context);




}