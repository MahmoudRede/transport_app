import 'package:flutter/material.dart';
import '../../styles/colors/color_manager.dart';

class DefaultTextFormField extends StatefulWidget {
  final String hintText;
  final String labelText;
  IconData? prefixIcon;
  IconData? suffixIcon;
  bool isPass;
  String value;
  String validateMessage;
  String suffixImage;
  int? lines;
  Color? hintColor;
  TextInputType textInputType;
  bool isEnabled;
  bool isImage;
  TextEditingController controller = TextEditingController();

  DefaultTextFormField(
      { this.hintText='',
        required this.controller,
        this.hintColor = Colors.grey,
        this.isPass = false,
        this.isEnabled = true,
        required this.textInputType,
        this.labelText='',
        this.isImage = false,
        this.value = '',
        this.prefixIcon,
        this.suffixIcon,
        this.suffixImage='',
        this.validateMessage='',
        this.lines = 1,
        Key? key})
      : super(key: key);

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return widget.isPass == false
        ? Container(
           clipBehavior: Clip.antiAliasWithSaveLayer,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(50)
           ),
          child: TextFormField(
            textInputAction: TextInputAction.next,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontSize: 15.0,
              color: ColorManager.black,
            ),
            decoration: InputDecoration(

              fillColor: ColorManager.white,
              filled: true,

              border: InputBorder.none,
              hintText: widget.hintText,
              labelStyle:Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 15.0,
                color: ColorManager.textColor,
              ),
              hintStyle:Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 16.0,
                color: ColorManager.grey,
              ),
              errorStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 13.0,
                color: ColorManager.red,
              ),


              suffixIcon: Image(
                height: MediaQuery.sizeOf(context).height*.01,
                image: AssetImage(widget.suffixImage),
              ),

            ),
            maxLines: widget.lines,
            keyboardType: widget.textInputType,
            controller: widget.controller,
            enabled: widget.isEnabled,
            onChanged: (value) {
              widget.value = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return widget.validateMessage;
              }
              return null;
            },
          ),
        )
        : Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50)
          ),
          child: TextFormField(
            textInputAction: TextInputAction.done,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontSize: 15.0,
              color: ColorManager.black,

            ),
            decoration: InputDecoration(
                fillColor: ColorManager.white,
                filled: true,

                border: InputBorder.none,
                hintText: widget.hintText,
                labelStyle:Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 16.0,
                  color: ColorManager.black,
                ),
                hintStyle:Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 16.0,
                  color: ColorManager.grey,
                ),
                errorStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 15.0,
                  color: ColorManager.red,
                ),
              suffixIcon: Image(
              height: MediaQuery.sizeOf(context).height*.01,
              image: AssetImage(widget.suffixImage),
              ),),
            keyboardType: widget.textInputType,
            controller: widget.controller,
            enabled: widget.isEnabled,
            obscureText: isChecked,
            onChanged: (value) {
              widget.value = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return widget.validateMessage;
              }
              return null;
            },
          ),
        );
  }
}
