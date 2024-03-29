import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_example/screens/todo_screen.dart';
import 'package:redux_example/store/store.dart';

import 'models/app_state.dart';

void main() {
  final store = createStore(); // createStore() 함수를 호출하여 Redux store 생성
  runApp(MyApp(store: store)); // 생성된 Redux store를 MyApp 위젯에 주입
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'To-Do App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TodoScreen(),
      ),
    );
  }
}
