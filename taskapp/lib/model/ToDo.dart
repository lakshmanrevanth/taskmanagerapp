class ToDo {
  String? id;
  String? ToDoTitle;
  bool ischecked;

  ToDo({
    required this.id,
    required this.ToDoTitle,
    this.ischecked = false,
  });

  static List<ToDo> todoList() {
    return [];
  }
}
