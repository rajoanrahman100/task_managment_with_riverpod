import 'package:flutter/material.dart';
import 'package:task_managment_with_riverpod/common/widgets/appstyle.dart';
import 'package:task_managment_with_riverpod/common/widgets/reusabletext.dart';

class CustomOutlineBtn extends StatelessWidget {
  CustomOutlineBtn({this.onTap, this.width, this.height, this.color1, this.color2, this.text});

  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final Color? color1;
  final Color? color2;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color1, borderRadius: BorderRadius.all(Radius.circular(12)), border: Border.all(width: 1, color: color2!)),
        child: Center(
          child: ReusableText(
            text: text!,
            style: appStyle(18, color2!, FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
