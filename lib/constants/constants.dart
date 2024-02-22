import '../data/models/onboarding_model.dart';

class Constants{

  static List onBoardingScreens=[
      OnBoardingModel(
          title: 'Freelancer',
          content: 'A freelancer is a self-employed individual who offers services to clients on a project basis, often working remotely and managing their own business',
          image: 'assets/icons/onboarding1.json'
      ),
      OnBoardingModel(
          title: 'Investment',
          content: 'We ate constantly adding your favourite restaurant throughout the territory and around your area carefully selected',
          image: 'assets/icons/onboarding2.json'
      ),
      OnBoardingModel(
          title: 'Social Media',
          content: ' it is easy to determine the exact number of calories consumed at each meal',
          image: 'assets/icons/onboarding3.json'
      ),

  ];
  static List<String> profileTitles=[
    'بياناتي',
    'الاشعارات',
    'اللغة',
     'اتصل بنا',
    'شارك التطبيق',
    'تسجيل الخروج',
  ];
  static List<String> profileImages=[
    'assets/images/user_icon.png',
    'assets/images/notification.png',
    'assets/images/translate.png',
    'assets/images/call.png',
    'assets/images/share.png',
    'assets/images/arrow-back.png',
  ];


}