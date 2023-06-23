import 'package:flutter/material.dart';
import 'package:task_managment_with_riverpod/common/utils/constants.dart';
import 'package:task_managment_with_riverpod/common/widgets/appstyle.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {this.textInputType, this.hintText, this.suffixIcon, this.prefixIcon, this.hintStyle, this.controller, this.onChanged});

  final TextInputType? textInputType;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConst.kWidth * 0.9,
      decoration: BoxDecoration(color: AppConst.kLight, borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius))),
      child: TextFormField(
        keyboardType: textInputType,
        controller: controller,
        cursorHeight: 25,
        onChanged: onChanged,
        style: appStyle(18, AppConst.kBkDark, FontWeight.w700),
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          suffixIconColor: AppConst.kBkDark,
          hintStyle: hintStyle,
          errorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide(color: AppConst.kRed, width: 0.5)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide(color: Colors.transparent, width: 0.5)),
          focusedErrorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide(color: AppConst.kRed, width: 0.5)),
          disabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide(color: AppConst.kGrey, width: 0.5)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide(color: AppConst.kBkDark, width: 0.5)),
        ),
      ),
    );
  }
}
