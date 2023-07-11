import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:task_managment_with_riverpod/features/todo/controller/todo/todo_provider.dart';
import 'package:task_managment_with_riverpod/features/todo/widgets/todo_tile.dart';

import '../../../common/utils/constants.dart';
import '../../../common/utils/navigationUtils.dart';
import '../../../common/widgets/expansion_tile.dart';
import '../controller/expansion_provider.dart';
import '../pages/edit_todo.dart';

class DayAfterTomorrowList extends ConsumerWidget {
  const DayAfterTomorrowList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoStateProvider);

    String dayAfterTomorrow = ref.read(todoStateProvider.notifier).getDayAfterTomorrow();

    var tomorrowTaskList = todos.where((element) => element.date!.contains(dayAfterTomorrow)).toList();

    var color = ref.read(todoStateProvider.notifier).getRandomColor();

    return ExpansionTileWidget(
      text: DateTime.now().add(Duration(days: 2)).toString().substring(5,10),
      text2: "Day after tomorrow task",
      onExpansionChanged: (bool expanded) {
        ref.read(expansionStateProvider.notifier).setStart(!expanded);
      },
      trailing: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: ref.watch(expansionStateProvider)
            ? Icon(
          AntDesign.circledown,
          color: AppConst.kLight,
        )
            : Icon(
          AntDesign.closecircleo,
          color: AppConst.kBlueLight,
        ),
      ),
      children: [
        for (var todo in tomorrowTaskList)
          TodoTile(
            start: todo.startTime,
            end: todo.endTime,
            title: todo.title,
            description: todo.desc,
            color: color,
            delete: () {
              ref.read(todoStateProvider.notifier).deleteTodo(todo.id ?? 0);
            },
            edit: GestureDetector(
              onTap: () {
                titles=todo.title.toString();
                desc=todo.desc.toString();
                NavigationUtils.navigateToPage(context, EditTodo(id:todo.id ?? 0));
              },
              child: Icon(MaterialCommunityIcons.circle_edit_outline),
            ),
            switcher: SizedBox.shrink(),
          )
      ],
    );
  }
}
