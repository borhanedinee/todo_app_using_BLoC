import 'package:flutter/material.dart';
import 'package:todos/main.dart';

class TaskStatusItem extends StatelessWidget {
  final String status;

  final IconData? icon;

  final int numOfTasks;

  final Color color;

  const TaskStatusItem(
      {super.key,
      required this.icon,
      required this.status,
      required this.numOfTasks,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: size.width * 0.43,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.13),
              child: Icon(
                icon,
                size: 28,
                color: Colors.white,
              )),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                status,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              Text('$numOfTasks tasks',
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 12
                  )),
            ],
          )
        ],
      ),
    );
  }
}
