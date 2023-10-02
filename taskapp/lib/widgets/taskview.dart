import 'package:flutter/material.dart';
import 'package:taskapp/model/ToDo.dart';

class TaskCard extends StatelessWidget {
  final ToDo todo;
  final ontodochange;
  final ondelete;
  TaskCard(
      {super.key,
      required this.todo,
      required this.ontodochange,
      required this.ondelete});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        onTap: () {
          ontodochange(todo);
        },
        title: Text(
          todo.ToDoTitle!,
          style: TextStyle(
            decoration: todo.ischecked ? TextDecoration.lineThrough : null,
          ),
        ),
        leading: todo.ischecked
            ? Icon(Icons.check_box_rounded)
            : Icon(Icons.check_box_outline_blank_rounded),
        trailing: IconButton(
          onPressed: () {
            ondelete(todo.id);
          },
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
