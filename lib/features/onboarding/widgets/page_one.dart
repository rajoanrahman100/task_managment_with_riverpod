import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_managment_with_riverpod/common/utils/constants.dart';
import 'package:task_managment_with_riverpod/common/widgets/appstyle.dart';
import 'package:task_managment_with_riverpod/common/widgets/height_spacer.dart';
import 'package:task_managment_with_riverpod/common/widgets/reusabletext.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConst.kHeight,
      width: AppConst.kWidth,
      color: AppConst.kBkDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Image.asset("assets/images/todo.png"),
          ),
          HeightSpacer(height: 100),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ReusableText(text: "Todo with Riverpod", style: appStyle(30, AppConst.kLight, FontWeight.w600))],
          ),
          HeightSpacer(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              "Wellcome!! Do you want to create a task fast and with ease",
              textAlign: TextAlign.center,
              style: appStyle(16, AppConst.kGreyLight, FontWeight.normal),
            ),
          )
        ],
      ),
    );
  }
}
