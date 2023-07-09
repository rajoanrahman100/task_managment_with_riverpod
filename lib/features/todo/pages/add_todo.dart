import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_managment_with_riverpod/common/utils/constants.dart';
import 'package:task_managment_with_riverpod/common/widgets/appstyle.dart';
import 'package:task_managment_with_riverpod/common/widgets/custom_outline_btn.dart';
import 'package:task_managment_with_riverpod/common/widgets/custom_text_field.dart';
import 'package:task_managment_with_riverpod/common/widgets/height_spacer.dart';

class AddTodo extends ConsumerStatefulWidget {
  const AddTodo({super.key});

  @override
  ConsumerState<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends ConsumerState<AddTodo> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            HeightSpacer(height: 20),
            CustomTextField(
              hintText: "Add title",
              controller: titleController,
              hintStyle: appStyle(16, AppConst.kGreyLight, FontWeight.w600),
            ),
            HeightSpacer(height: 20),
            CustomTextField(
              hintText: "Add description",
              controller: descController,
              hintStyle: appStyle(16, AppConst.kGreyLight, FontWeight.w600),
            ),
            HeightSpacer(height: 20),
            CustomOutlineBtn(
              onTap: (){},
              width: AppConst.kWidth,
              height: 52.h,
              color1: AppConst.kLight,
              color2: AppConst.kBlueLight,
              text: "Set Date",
            ),
            HeightSpacer(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOutlineBtn(
                  onTap: (){},
                  width: AppConst.kWidth * 0.4,
                  height: 52.h,
                  color1: AppConst.kLight,
                  color2: AppConst.kBlueLight,
                  text: "Start Time",
                ),
                CustomOutlineBtn(
                  onTap: (){},
                  width: AppConst.kWidth * 0.4,
                  height: 52.h,
                  color1: AppConst.kLight,
                  color2: AppConst.kBlueLight,
                  text: "End Time",
                ),
              ],
            ),
            HeightSpacer(height: 20),

            CustomOutlineBtn(
              onTap: (){},
              width: AppConst.kWidth * 0.4,
              height: 52.h,
              color1: AppConst.kLight,
              color2: AppConst.kGreen,
              text: "Submit",
            ),
          ],
        ),
      ),
    );
  }
}
