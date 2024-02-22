import 'package:flutter/material.dart';
import 'package:transport_app/styles/colors/color_manager.dart';
import '../../../constants/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
        shape: const Border(
          bottom: BorderSide(color: ColorManager.white, width: 1.0),
        ),
        elevation: 0.0,
        title: const Text(
          "البروفايل",
          style: TextStyle(color: ColorManager.white),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [

          SizedBox(height: MediaQuery.sizeOf(context).height*.05,),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).height*.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('خالد الشهري',style: TextStyle(
                        color: ColorManager.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.sizeOf(context).height*.03
                    ),),
                    Text('info@gmail.com',style: TextStyle(
                        color: ColorManager.grey,
                        fontSize: MediaQuery.sizeOf(context).height*.015
                    ),),
                  ],
                ),
                SizedBox(width: MediaQuery.sizeOf(context).height*.02,),
                Image(
                  image: const AssetImage('assets/images/man.png'),
                  height: MediaQuery.sizeOf(context).height*.1,
                ),
              ],
            ),
          ),

          SizedBox(height: MediaQuery.sizeOf(context).height*.03,),

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
                height: MediaQuery.sizeOf(context).height*.5,
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

                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(Constants.profileTitles[index],style: TextStyle(
                                    color: ColorManager.textColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: MediaQuery.sizeOf(context).height*.017
                                ),),
                                SizedBox(width: MediaQuery.sizeOf(context).height*.02,),

                              ],
                            ),
                            SizedBox(height: MediaQuery.sizeOf(context).height*.01,),
                            index!=6?const Divider():Container(),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context,index){
                      return SizedBox(height: MediaQuery.sizeOf(context).height*.01,);
                    },
                    itemCount: Constants.profileTitles.length
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
