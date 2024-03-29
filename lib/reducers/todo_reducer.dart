import '../actions/todo_actions.dart';
import '../models/app_state.dart';

// AppState
AppState appReducer(AppState state, dynamic action) {
  if (action is TodoAction) {
    print('================ 리듀서 호출 ================');
    print(action);
    switch (action.type) {
      case ActionType.add:
        return AppState(todos: [...state.todos, action.todo]);
      case ActionType.toggle:
        return AppState(
          todos: state.todos.map((todo) {
            if (todo.title == action.todo.title) {
              return todo.copyWith(isCompleted: !todo.isCompleted);
            }
            return todo;
          }).toList(),
        );
      case ActionType.remove:
        return AppState(
          todos: state.todos.where((todo) => todo.title != action.todo.title).toList(),
        );
      default:
        return state;
    }
  }
  return state;
}
