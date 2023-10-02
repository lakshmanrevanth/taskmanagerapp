import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskapp/screens/homepage.dart';

class CreateTask extends StatefulWidget {
  final onadd;
  
  CreateTask({
    super.key,
    required this.onadd,
  });
  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  late TextEditingController controller;
  String text = "";
  bool taskpriority = false;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 350,
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: "Enter Your Task Name",
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  taskpriority
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              taskpriority = false;
                            });
                          },
                          child: const Icon(Icons.star))
                      : InkWell(
                          onTap: () {
                            setState(() {
                              taskpriority = true;
                            });
                          },
                          child: const Icon(Icons.star_border_outlined)),
                  const SizedBox(
                    width: 40,
                  ),
                  InkWell(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(formattedDate);
                          //formatted date output using intl package =>  2021-03-16
                        } else {}
                      },
                      child: Icon(Icons.date_range)),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (controller.text != "") {
                        print(controller.text);
                        widget.onadd(controller.text);
                        Navigator.pop(context);
                      } else {
                        null;
                      }
                    },
                    child: const Text("Create a Task"),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
