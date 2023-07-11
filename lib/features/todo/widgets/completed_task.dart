import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:task_managment_with_riverpod/features/todo/widgets/todo_tile.dart';

import '../controller/todo/todo_provider.dart';

class CompletedTask extends ConsumerWidget {
  const CompletedTask({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var listData = ref.watch(todoStateProvider);
    var last30Days = ref.read(todoStateProvider.notifier).last30days();
    var completedTaskList = listData.where((element) => element.isCompleted == 1 || last30Days.contains(element.date!.substring(0,10))).toList();
    var color = ref.read(todoStateProvider.notifier).getRandomColor();

    return ListView.builder(
        itemCount: completedTaskList.length,
        itemBuilder: (_, index) {
          final data = completedTaskList[index];
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
              onTap: () {},
              child: Icon(MaterialCommunityIcons.circle_edit_outline),
            ),
            switcher: SizedBox.shrink()
          );
        });
  }
}
