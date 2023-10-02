import 'package:flutter/material.dart';
import 'package:taskapp/model/ToDo.dart';
import 'package:taskapp/screens/createtask.dart';
import 'package:taskapp/widgets/taskview.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void ontodo(ToDo todo) {
    setState(() {
      todo.ischecked = !todo.ischecked;
    });
  }

  void onadd(String todoname) {
    setState(() {
      list.add(
        ToDo(id: DateTime.now().toString(), ToDoTitle: todoname),
      );
    });
  }

  void ondelete(String id) {
    setState(() {
      list.removeWhere((element) => element.id == id);
    });
  }

  final list = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {},
          child: Ink(
            child: Icon(Icons.menu),
          ),
        ),
        title: const Text("To Do List"),
        centerTitle: false,
        actions: [
          InkWell(
            onTap: () {},
            child: Ink(
              child: Icon(Icons.search),
            ),
          ),
          Icon(Icons.verified_user_rounded),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            for (ToDo to in list)
              TaskCard(
                todo: to,
                ontodochange: ontodo,
                ondelete: ondelete,
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return CreateTask(onadd: onadd);
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
