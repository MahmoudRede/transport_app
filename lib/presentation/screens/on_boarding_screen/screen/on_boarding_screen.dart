import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:transport_app/presentation/screens/home_screen/screens/home_screen.dart';
import 'package:transport_app/presentation/screens/on_boarding_screen/widget/pageview_item.dart';
import 'package:transport_app/presentation/screens/start_screen/start_screen.dart';
import 'package:transport_app/presentation/widgets/default_button.dart';
import 'package:transport_app/styles/colors/color_manager.dart';


class OnBoarding extends StatefulWidget {

  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var pageController=PageController();
  int currentIndex=1;
  late Timer timer;

  @override
  void initState() {

    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      Future.delayed(const Duration(seconds: 7),(){
        if(currentIndex==3){
        }
        else{
          currentIndex++;
          pageController.nextPage(duration: const Duration(seconds: 3), curve: Curves.fastOutSlowIn);
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).height*.035,
            vertical: MediaQuery.sizeOf(context).height*.035,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                onPageChanged: (val){

                },
                itemBuilder: (context,index){
                  return PageViewItem(index: index);
                },
                itemCount: 3 ,
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: JumpingDotEffect(
                  dotColor: ColorManager.grey,
                  activeDotColor: ColorManager.primaryColor,
                  dotWidth: 12,
                  dotHeight: 12,
              ),

            ),
            SizedBox(height: size.height*.03,),

            DefaultButton(
              width: MediaQuery.sizeOf(context).height*.6,
              height: MediaQuery.sizeOf(context).height * .058,
              backGroundColor: ColorManager.primaryColor,
              content: const Text('Get Started',style: TextStyle(
                color: ColorManager.white,
              ),),
              onPressed: (){
                Get.to(const StartScreen(),transition: Transition.fadeIn);
              },
            ),
            SizedBox(height:size.height*.005,),
          ],
        ),
      ),
    );
  }
}