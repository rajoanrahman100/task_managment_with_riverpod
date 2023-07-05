import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:task_managment_with_riverpod/common/utils/constants.dart';
import 'package:task_managment_with_riverpod/common/widgets/appstyle.dart';
import 'package:task_managment_with_riverpod/common/widgets/height_spacer.dart';
import 'package:task_managment_with_riverpod/common/widgets/reusabletext.dart';
import 'package:task_managment_with_riverpod/common/widgets/width_spacer.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key, this.color, this.title, this.description, this.start, this.end, this.edit, this.delete, this.switcher});

  final Color? color;
  final String? title;
  final String? description;
  final String? start;
  final String? end;
  final Widget? edit;
  final Widget? switcher;
  final void Function()? delete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Stack(
        children: [
          Container(
            width: AppConst.kWidth,
            decoration:
                BoxDecoration(color: AppConst.kGreyLight, borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius))),
            padding: EdgeInsets.all(8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),

                        ///TODO: Add Dynamic Colors
                        color: color ?? AppConst.kRed,
                      ),
                    ),
                    WidthSpacer(width: 15),
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: SizedBox(
                        width: AppConst.kWidth*0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableText(text: title ?? "Title", style: appStyle(18, AppConst.kLight, FontWeight.bold)),
                            HeightSpacer(height: 3),
                            ReusableText(
                                text: description ?? "Description", style: appStyle(12, AppConst.kLight, FontWeight.bold)),
                            HeightSpacer(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 25,
                                  width: AppConst.kWidth*0.3,
                                  decoration: BoxDecoration(
                                      color: AppConst.kBkDark,
                                      border: Border.all(width: 0.3, color: AppConst.kGreyBk),
                                      borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius))),
                                  child: Center(
                                    child: ReusableText(
                                      text: "$start | $end",
                                      style: appStyle(12, AppConst.kLight, FontWeight.normal),
                                    ),
                                  ),
                                ),
                                WidthSpacer(width: 20),
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment,
                                  children: [SizedBox(child: edit),WidthSpacer(width: 20),GestureDetector(
                                    onTap: delete,
                                    child: Icon(MaterialCommunityIcons.delete_circle),
                                  )],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 0.h),
                  child: switcher,
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
