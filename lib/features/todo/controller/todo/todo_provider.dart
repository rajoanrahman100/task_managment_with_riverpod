
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_managment_with_riverpod/common/helpers/db_helper.dart';

import '../../../../common/models/task_model.dart';

part 'todo_provider.g.dart';

@riverpod
class TodoState extends _$TodoState{
  @override
  List<Task> build(){
    return [];
  }
  void refresh()async{
    final data=await DBHelper.getItems();
    state=data.map((e) => Task.fromJson(e)).toList();
   // state=newState;
  }

  void addItem(Task task)async{
    await DBHelper.createItem(task);
    refresh();
  }

  void updateItem(int id, String title, String desc, int isCompleted, String date, String startTime, String endTime)async{
    await DBHelper.updateItem(id,title,desc,isCompleted,date,startTime,endTime);
    refresh();
  }

  void deleteItem(int id)async{
    await DBHelper.deleteItem(id);
    refresh();
  }
}