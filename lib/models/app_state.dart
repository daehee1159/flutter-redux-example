import 'package:redux_example/models/todo.dart';

class AppState {
  final List<Todo> todos;

  AppState({required this.todos});

  factory AppState.initialState() {
    return AppState(todos: []);
  }
}
