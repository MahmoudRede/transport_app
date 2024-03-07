
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport_app/helper/shared_preference.dart';
import 'package:transport_app/presentation/screens/profile_screen/edit_profile_screen.dart';
import 'package:transport_app/styles/colors/color_manager.dart';
import '../../../constants/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shape: const Border(
          bottom: BorderSide(color: ColorManager.white, width: 1.0),
        ),
        elevation: 0.0,
        title: const Text(
          "البروفايل",
          style: TextStyle(color: ColorManager.primaryColor),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [

          SizedBox(height: MediaQuery.sizeOf(context).height*.01,),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).height*.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: ColorManager.primaryColor,
                  radius: MediaQuery.sizeOf(context).height*.052,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/smart-logo.jpeg'),
                    radius: MediaQuery.sizeOf(context).height*.05,
                  ),
                ),

                SizedBox(width: MediaQuery.sizeOf(context).height*.02,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(UserDataFromStorage.driverUserName,style: TextStyle(
                        color: ColorManager.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.sizeOf(context).height*.03
                    ),),
                    Text(UserDataFromStorage.driverEmail,style: TextStyle(
                        color: ColorManager.grey,
                        fontSize: MediaQuery.sizeOf(context).height*.015
                    ),),
                  ],
                ),

              ],
            ),
          ),

          SizedBox(height: MediaQuery.sizeOf(context).height*.035,),

          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).height*.02
            ),
            child: Material(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: MediaQuery.sizeOf(context).height*.3,
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).height*.02,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).height*.02,
                  vertical: MediaQuery.sizeOf(context).height*.03,
                ),
                decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: ListView.separated(
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){

                          if(index==0){
                            Get.to(
                                  ()=>const EditProfileScreen(),
                            );
                          }
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image(
                                  image: AssetImage(Constants.profileImages[index]),
                                  height: MediaQuery.sizeOf(context).height*.017,
                                  color: ColorManager.primaryColor,
                                ),
                                SizedBox(width: MediaQuery.sizeOf(context).height*.02,),

                                Text(Constants.profileTitles[index],style: TextStyle(
                                    color: ColorManager.textColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: MediaQuery.sizeOf(context).height*.017
                                ),),


                              ],
                            ),
                            SizedBox(height: MediaQuery.sizeOf(context).height*.01,),
                            index!=3?const Divider():Container(),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context,index){
                      return SizedBox(height: MediaQuery.sizeOf(context).height*.01,);
                    },
                    itemCount: Constants.profileImages.length
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
