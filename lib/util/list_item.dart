import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Listitem extends StatelessWidget {

  final String todoname;
  final bool checked;
  final Function(bool?)? onchanged;
  final Function(BuildContext)? deletFunction;

  const Listitem({
    super.key,
    required this.todoname,
    required this.checked,
    required this.onchanged,
    required this.deletFunction
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20,right: 20,top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deletFunction,
              icon: Icons.delete,
              backgroundColor: Colors.yellow,
              borderRadius: BorderRadius.circular(8),
            )
          ]
        ),
        child: Container(
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: Colors.blue[700],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: checked, 
                onChanged: onchanged,
                activeColor: Colors.black),
              Text(
              todoname,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              )),
          ]),
        ),
      ),
    );
  }
}