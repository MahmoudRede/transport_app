import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transport_app/business_logic/app_cubit.dart';
import 'package:transport_app/firebase_options.dart';
import 'package:transport_app/helper/shared_preference.dart';
import 'package:transport_app/presentation/screens/Login_screen/login_screen.dart';
import 'package:transport_app/presentation/screens/home_layout/home_layout.dart';
import 'package:transport_app/presentation/screens/splash_screen/splash_screen.dart';
import 'package:transport_app/styles/theme_manager/theme_manager.dart';
import 'package:transport_app/utiles/local/cash_helper.dart';
import 'business_logic/localization_cubit/app_localization.dart';
import 'business_logic/localization_cubit/localization_cubit.dart';
import 'business_logic/localization_cubit/localization_states.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  await SharedPreferences.getInstance();
  await UserDataFromStorage.getData();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
//   to make the application in portrait mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => AppCubit()..getOrdersFromFirebase()

        ),
        BlocProvider(
            create: (BuildContext context) =>
            LocalizationCubit()..fetchLocalization()),

      ],
      child: BlocConsumer<LocalizationCubit,LocalizationStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return GetMaterialApp(
              title: 'Smart Rabbit Drivers',
              theme: getApplicationTheme(context),
              debugShowCheckedModeBanner: false,
              home: const SplashScreen(),
              localizationsDelegates:  const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale("en",""),
                Locale("ar",""),
              ],
              locale: LocalizationCubit.get(context).appLocal,
              localeResolutionCallback: (currentLang , supportLang){
                if(currentLang != null) {
                  for(Locale locale in supportLang){
                    if(locale.languageCode == currentLang.languageCode){
                      return currentLang;
                    }
                  }
                }
                return supportLang.first;
              },
            );
          },
      ),
    );
  }
}

