import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import '../models/app_state.dart';
import '../reducers/todo_reducer.dart';

// 스토어 생성
class StoreContainer extends StatelessWidget {
  final Store<AppState> store;
  final Widget child;

  const StoreContainer({super.key, required this.store, required this.child});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: child,
    );
  }
}

Store<AppState> createStore() {
  return Store<AppState>(
    appReducer,
    initialState: AppState.initialState(),
    middleware: [thunkMiddleware],
  );
}
