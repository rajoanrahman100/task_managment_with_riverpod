import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_managment_with_riverpod/common/models/task_model.dart';
import 'package:task_managment_with_riverpod/common/utils/constants.dart';
import 'package:task_managment_with_riverpod/common/widgets/appstyle.dart';
import 'package:task_managment_with_riverpod/common/widgets/custom_outline_btn.dart';
import 'package:task_managment_with_riverpod/common/widgets/custom_text_field.dart';
import 'package:task_managment_with_riverpod/common/widgets/height_spacer.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import 'package:task_managment_with_riverpod/features/todo/controller/dates_provider.dart';
import 'package:task_managment_with_riverpod/features/todo/controller/todo/todo_provider.dart';

class EditTodo extends ConsumerStatefulWidget {
  const EditTodo({super.key, required this.id});

  final int id;

  @override
  ConsumerState<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends ConsumerState<EditTodo> {
  final titleController = TextEditingController(text: titles);
  final descController = TextEditingController(text: desc);

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
                    theme: picker.DatePickerTheme(doneStyle: TextStyle(color: AppConst.kGreen, fontSize: 16)), onConfirm: (date) {
                  debugPrint('confirm $date');
                  ref.read(dateStateProvider.notifier).setDate(date.toString());
                }, currentTime: DateTime.now(), locale: picker.LocaleType.en);
              },
              width: AppConst.kWidth,
              height: 52.h,
              color1: AppConst.kBlueLight,
              color2: AppConst.kLight,
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
                  color1: AppConst.kBlueLight,
                  color2: AppConst.kLight,
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
                  color1: AppConst.kBlueLight,
                  color2: AppConst.kLight,
                  text: finishTime == "" ? "End Time" : finishTime.toString().substring(10, 16),
                ),
              ],
            ),
            HeightSpacer(height: 20),
            CustomOutlineBtn(
              onTap: () {
                if (titleController.text.isNotEmpty &&
                    descController.text.isNotEmpty &&
                    scheduleDate.isNotEmpty &&
                    startTime.isNotEmpty &&
                    finishTime.isNotEmpty) {

                  ref.read(todoStateProvider.notifier).updateTodo(widget.id, titleController.text, descController.text, 0,
                      scheduleDate, startTime.substring(10, 16), finishTime.substring(10, 16));
                  ref.read(dateStateProvider.notifier).setDate("");
                  ref.read(finishTimeStateProvider.notifier).setFinishTime("");
                  ref.read(startTimeStateProvider.notifier).setStartTime("");
                  Navigator.of(context).pop();
                } else {
                  debugPrint("Failed to add task");
                }
              },
              width: AppConst.kWidth * 0.4,
              height: 52.h,
              color1: AppConst.kGreen,
              color2: AppConst.kLight,
              text: "Submit",
            ),
          ],
        ),
      ),
    );
  }
}
