import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_managment_with_riverpod/common/widgets/custom_outline_btn.dart';

import '../../../common/utils/constants.dart';
import '../../../common/widgets/height_spacer.dart';
import '../../auth/pages/login_page.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConst.kHeight,
      width: AppConst.kWidth,
      color: AppConst.kGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Image.asset("assets/images/todo.png"),
          ),
          HeightSpacer(height: 50),
          CustomOutlineBtn(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
            width: AppConst.kWidth * 0.9,
            height: AppConst.kHeight * 0.06,
            color2: AppConst.kLight,
            text: "Login with a phone number",
          )
        ],
      ),
    );
  }
}
