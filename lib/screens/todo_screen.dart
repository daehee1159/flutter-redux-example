import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../actions/todo_actions.dart';
import '../models/app_state.dart';
import '../models/todo.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: StoreConnector<AppState, List<Todo>>(
        converter: (store) => store.state.todos,
        builder: (context, todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                title: Text(todo.title),
                leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) {
                    dispatchTodoActionCreator(
                        StoreProvider.of(context), todo, ActionType.toggle);
                  },
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    dispatchTodoActionCreator(
                        StoreProvider.of(context), todo, ActionType.remove);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Add Todo'),
                content: TextField(
                  autofocus: true,
                  decoration: InputDecoration(labelText: 'Todo'),
                  onSubmitted: (value) {
                    final newTodo = Todo(title: value, isCompleted: false);
                    dispatchTodoActionCreator(
                        StoreProvider.of(context), newTodo, ActionType.add);
                    Navigator.pop(context);
                  },
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
