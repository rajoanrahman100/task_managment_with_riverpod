import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:task_managment_with_riverpod/common/utils/constants.dart';
import 'package:task_managment_with_riverpod/features/todo/pages/edit_todo.dart';
import 'package:task_managment_with_riverpod/features/todo/widgets/todo_tile.dart';

import '../../../common/utils/navigationUtils.dart';
import '../controller/todo/todo_provider.dart';

class TodayTask extends ConsumerWidget {
  const TodayTask({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var listData = ref.watch(todoStateProvider);
    var today = ref.read(todoStateProvider.notifier).getToday();
    var todayList = listData.where((element) => element.isCompleted == 0 && element.date!.contains(today)).toList();
    var color = ref.read(todoStateProvider.notifier).getRandomColor();

    return ListView.builder(
        itemCount: todayList.length,
        itemBuilder: (_, index) {
          final data = todayList[index];
          var isCompleted = ref.read(todoStateProvider.notifier).getStatus(data);
          return TodoTile(
            title: data.title,
            description: data.desc,
            start: data.startTime,
            end: data.endTime,
            color: color,
            delete: () {
              ref.read(todoStateProvider.notifier).deleteTodo(data.id ?? 0);
            },
            edit: GestureDetector(
              onTap: () {
                titles = data.title.toString();
                desc = data.desc.toString();

                NavigationUtils.navigateToPage(context, EditTodo(id: data.id ?? 0));

              },
              child: Icon(MaterialCommunityIcons.circle_edit_outline),
            ),
            switcher: Switch(
              value: isCompleted,
              onChanged: (value) {
                ref.read(todoStateProvider.notifier).markAsComplete(data.id ?? 0, data.title.toString(), data.desc.toString(), 1,
                    data.date.toString(), data.startTime.toString(), data.endTime.toString());
              },
            ),
          );
        });
  }
}
