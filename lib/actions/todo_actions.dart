// 액션 생성자 함수
import '../models/app_state.dart';

import 'package:redux/redux.dart';
import '../models/todo.dart';

// Actions
class TodoAction {
  final Todo todo;
  final ActionType type;

  TodoAction(this.todo, this.type);
}

enum ActionType {
  add,
  toggle,
  remove,
}

// Action Creators
void dispatchTodoActionCreator(Store<AppState> store, Todo todo, ActionType type) {
  print('================ 액션 호출  타입 : $type ================');
  store.dispatch(TodoAction(todo, type));
}
