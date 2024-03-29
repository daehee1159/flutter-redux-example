class Todo {
  final String title;
  final bool isCompleted;

  Todo({
    required this.title,
    required this.isCompleted,
  });

  Todo copyWith({
    String? title,
    bool? isCompleted,
  }) {
    return Todo(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
