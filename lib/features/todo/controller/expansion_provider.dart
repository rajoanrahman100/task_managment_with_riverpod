import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expansion_provider.g.dart';

@riverpod
class ExpansionState extends _$ExpansionState {
  @override
  bool build() {
    return false;
  }

  void setStart(bool newState) {
    state = newState;
  }
}

@riverpod
class ExpansionState0 extends _$ExpansionState0 {
  @override
  bool build() {
    return false;
  }

  void setStart(bool newState) {
    state = newState;
  }
}
