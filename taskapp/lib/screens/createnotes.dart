import 'package:flutter/material.dart';

class CreateNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Notes"),
        centerTitle: false,
        actions: [
          const Icon(Icons.alarm),
          const SizedBox(
            width: 25,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("save"),
          )
        ],
      ),
      body: Container(
          margin: const EdgeInsets.all(16.0),
          child: const Column(
            children: [
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Title Here",
                  border: InputBorder.none,
                ),
              ),
              TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  labelText: "",
                  border: InputBorder.none,
                ),
              ),
            ],
          )),
    );
  }
}
