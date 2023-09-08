import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_managment_with_riverpod/common/helpers/db_helper.dart';
import 'package:task_managment_with_riverpod/common/models/user_model.dart';

final userProvider = StateNotifierProvider<UserState, List<UserModel>>((ref) {
  return UserState();
});

class UserState extends StateNotifier<List<UserModel>> {
  UserState() : super([]);

  void refresh() async {
    final data = await DBHelper.getUsers();
    state = data.map((e) => UserModel.fromJson(e)).toList();
  }
}
