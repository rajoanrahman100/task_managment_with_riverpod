import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_managment_with_riverpod/common/helpers/db_helper.dart';
import 'package:task_managment_with_riverpod/common/utils/constants.dart';

import '../../../../common/models/task_model.dart';

part 'todo_provider.g.dart';

@riverpod
class TodoState extends _$TodoState {
  @override
  List<Task> build() {
    return [];
  }

  Future<void> refresh() async {
    final data = await DBHelper.getItems();
    state = data.map((e) => Task.fromJson(e)).toList();
    // state=newState;
  }

  Future<void> addItem(Task task) async {
    await DBHelper.createItem(task);
    refresh();
  }

  Future<void> updateTodo(
      int id, String title, String desc, int isCompleted, String date, String startTime, String endTime) async {
    await DBHelper.updateItem(id, title, desc, isCompleted, date, startTime, endTime);
    refresh();
  }

  Future<void> deleteTodo(int id) async {
    await DBHelper.deleteItem(id);
    refresh();
  }

  Future<void> markAsComplete(
      int id, String title, String desc, int isCompleted, String date, String startTime, String endTime) async {
    await DBHelper.updateItem(id, title, desc, 1, date, startTime, endTime);
    refresh();
  }

  //today
  String getToday() {
    DateTime today = DateTime.now();
    return today.toString().substring(0, 10);
  }

  //tomorrow
  String getTomorrow() {
    DateTime tomorrow = DateTime.now().add(Duration(days: 1));
    return tomorrow.toString().substring(0, 10);
  }

  List<String> last30days() {
    DateTime today = DateTime.now();
    DateTime oneMonthAgo = today.subtract(Duration(days: 30));

    List<String> dates = [];
    for (int i = 0; i < 3; i++) {
      DateTime dateTime = oneMonthAgo.add(Duration(days: i));
      dates.add(dateTime.toString().substring(0, 10));
    }
    return dates;
  }

  bool getStatus(Task task) {
    bool? isCompleted;
    if (task.isCompleted == 0) {
      isCompleted = false;
    } else {
      isCompleted = true;
    }
    return isCompleted;
  }

  //dynamic color
  dynamic getRandomColor() {
    Random random = Random();
    int randomIndex = random.nextInt(colors.length);
    return colors[randomIndex];
  }
}
