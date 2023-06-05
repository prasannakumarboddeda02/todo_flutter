import 'package:flutter/material.dart';
import 'package:todo_flutter/util/button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;

  final VoidCallback onSaved;
  final VoidCallback onCancel;

  const DialogBox({super.key,required this.controller,required this.onSaved,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[200],
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a ToDo',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(text: 'Add', onPressed: onSaved),
                const SizedBox(width: 10),
                Button(text: 'cancel', onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}