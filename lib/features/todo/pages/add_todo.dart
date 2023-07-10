import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_managment_with_riverpod/common/utils/constants.dart';
import 'package:task_managment_with_riverpod/common/widgets/appstyle.dart';
import 'package:task_managment_with_riverpod/common/widgets/custom_outline_btn.dart';
import 'package:task_managment_with_riverpod/common/widgets/custom_text_field.dart';
import 'package:task_managment_with_riverpod/common/widgets/height_spacer.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import 'package:task_managment_with_riverpod/features/todo/controller/dates_provider.dart';

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
    var scheduleDate = ref.watch(dateStateProvider);
    var startTime = ref.watch(startTimeStateProvider);
    var finishTime = ref.watch(finishTimeStateProvider);

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
              onTap: () {
                picker.DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2018, 12, 12),
                    maxTime: DateTime(2030, 12, 12),
                    theme: picker.DatePickerTheme(doneStyle: TextStyle(color: AppConst.kGreen, fontSize: 16)),
                    onConfirm: (date) {
                  debugPrint('confirm $date');
                  ref.read(dateStateProvider.notifier).setDate(date.toString());
                }, currentTime: DateTime.now(), locale: picker.LocaleType.en);
              },
              width: AppConst.kWidth,
              height: 52.h,
              color1: AppConst.kLight,
              color2: AppConst.kBlueLight,
              text: scheduleDate == "" ? "Set Date" : scheduleDate.toString().substring(0, 10),
            ),
            HeightSpacer(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOutlineBtn(
                  onTap: () {
                    picker.DatePicker.showDateTimePicker(context, showTitleActions: true, onConfirm: (date) {
                      debugPrint('confirm $date');
                      ref.read(startTimeStateProvider.notifier).setStartTime(date.toString());
                    }, locale: picker.LocaleType.en);
                  },
                  width: AppConst.kWidth * 0.4,
                  height: 52.h,
                  color1: AppConst.kLight,
                  color2: AppConst.kBlueLight,
                  text: startTime == "" ? "Start Time" : startTime.toString().substring(10, 16),
                ),
                CustomOutlineBtn(
                  onTap: () {
                    picker.DatePicker.showDateTimePicker(context, showTitleActions: true, onConfirm: (date) {
                      debugPrint('confirm $date');
                      ref.read(finishTimeStateProvider.notifier).setFinishTime(date.toString());
                    }, locale: picker.LocaleType.en);
                  },
                  width: AppConst.kWidth * 0.4,
                  height: 52.h,
                  color1: AppConst.kLight,
                  color2: AppConst.kBlueLight,
                  text: finishTime == "" ? "End Time" : finishTime.toString().substring(10, 16),
                ),
              ],
            ),
            HeightSpacer(height: 20),
            CustomOutlineBtn(
              onTap: () {},
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
