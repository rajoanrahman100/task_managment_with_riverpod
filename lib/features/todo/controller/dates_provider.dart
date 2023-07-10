import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dates_provider.g.dart';

///Date Setting
@riverpod
class DateState extends _$DateState {
  @override
  String build() {
    return "";
  }

  void setDate(String newState) {
    state = newState;
  }
}

//Start Time
@riverpod
class StartTimeState extends _$StartTimeState {
  @override
  String build() {
    return "";
  }

  void setStartTime(String newState) {
    state = newState;
  }
}

//Finish Time
@riverpod
class FinishTimeState extends _$FinishTimeState {
  @override
  String build() {
    return "";
  }

  void setFinishTime(String newState) {
    state = newState;
  }
}