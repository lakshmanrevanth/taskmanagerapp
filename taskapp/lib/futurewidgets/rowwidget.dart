import 'package:flutter/material.dart';

class RowHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SizedBox(
        height: 35,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Tasks',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Ink(
                child: const Icon(
                  Icons.navigate_next,
                  size: 40,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
