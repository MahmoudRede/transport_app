import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transport_app/business_logic/app_cubit.dart';
import 'package:transport_app/business_logic/app_states.dart';
import 'package:transport_app/styles/app_size_config.dart';
import 'package:transport_app/styles/colors/color_manager.dart';


class CountryCodePickerWidget extends StatelessWidget {
  const CountryCodePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state) {
        return Container(
          height: SizeConfig.height * 0.06,
          width: SizeConfig.width,

          decoration: BoxDecoration(
            border: Border.all(
              color: ColorManager.gray,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(SizeConfig.height*0.01),
          ),

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.height*0.01),
            child: CountryPickerDropdown(
              initialValue: 'sa',
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: ColorManager.black,
                size: 15,
              ),
              itemBuilder: _buildDropdownItem,
              onValuePicked: (Country country) {
                // AuthCubit.get(context).changeCountryCode(country.phoneCode, isStudent);

                debugPrint(country.name);
              },
              isExpanded: true,


            ),
          ),
        );
      },
    );
  }
}


Widget _buildDropdownItem(Country country) {
  return SizedBox(
    height: SizeConfig.height * 0.05,
    width: SizeConfig.height * 0.085,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        SizedBox(
          height: SizeConfig.height * 0.014,
          width: SizeConfig.height * 0.024,
          child: CountryPickerUtils.getDefaultFlagImage(country),
        ),


        SizedBox(width: SizeConfig.height * 0.007,),

        Text(
          "+${country.phoneCode}",
          style: TextStyle(
            fontSize: SizeConfig.height * 0.01,
            color: ColorManager.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),

  );
}