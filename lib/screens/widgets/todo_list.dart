import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  final String newTask;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletFunction;

  ToDoList(
      {super.key,
      required this.newTask,
      required this.onChanged,
      required this.taskCompleted,
      required this.deletFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(6),
                  bottomRight: Radius.circular(6)),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(6)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Expanded(
                child: Text(
                  newTask,
                  style: TextStyle(
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
