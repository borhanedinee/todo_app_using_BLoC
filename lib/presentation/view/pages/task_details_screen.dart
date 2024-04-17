import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todos/domain/models/task.dart';
import 'package:todos/main.dart';

class TaskDetailsScreen extends StatefulWidget {
  final double completionPercentage;

  final int numberOfCompletedSubTasks;

final Task task;

  final Color progressColor;

  const TaskDetailsScreen(
      {super.key,
      required this.task,
      required this.completionPercentage,
      required this.numberOfCompletedSubTasks,
      required this.progressColor});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  bool? subtaskDone = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.navigate_before,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 20),
                        child: Text(
                          widget.task.taskTitle!,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      FittedBox(
                      child: Container(
                        
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        margin:
                            const EdgeInsets.only(left: 20, right: 8, bottom: 20),
                        decoration: BoxDecoration(
                          color: switch (widget.task.taskStatus!.toLowerCase()) {
                            'on going' => Colors.blue,
                            'in progress' => Colors.teal,
                            'pending' => Colors.amber,
                            String() => null,
                          },
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                           widget.task.taskStatus!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                        ),
                        child: Text(
                          'Task details',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 20, top: 10, bottom: 20),
                        width: size.width,
                        child: const Text(
                          'lazm 3liya nkml this task before june , start with front end and implement it very well then pass to the backend. \n   \nby ending thsi task yoz will have your first project in the professional career done.\n\nOrganize a meeting with the client time a week to manage any changes ect',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FittedBox(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 20, bottom: 20),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade900,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.alarm),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        RichText(
                                          text: const TextSpan(
                                            children: [
                                              TextSpan(text: 'Deadline:'),
                                              TextSpan(
                                                text: '  June 01',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(left: 20, bottom: 10),
                                  child: const Text(
                                    'Subtasks',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            CircularPercentIndicator(
                              progressColor: widget.progressColor,
                              radius: 34,
                              lineWidth: 6,
                              percent: widget.completionPercentage,
                              circularStrokeCap: CircularStrokeCap.round,
                              curve: Curves.easeOut,
                              animation: true,
                              animationDuration: 2000,
                              center: Text(
                                '${(widget.completionPercentage * 100).toInt()}%',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      subTaskItem(subTask: 'finishing the ui & ux'),
                      subTaskItem(subTask: 'setting up the serveer'),
                      subTaskItem(subTask: 'finishing backend'),
                      subTaskItem(subTask: 'finishing the u & ux'),
                      subTaskItem(subTask: 'finishing the u & ux'),
                      subTaskItem(subTask: 'finishing the u & ux'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FittedBox subTaskItem({required subTask}) {
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
        width: size.width,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width * 0.78,
              child: Text(
                subTask,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade400),
              ),
            ),
            Checkbox(
              value: subtaskDone,
              onChanged: (value) {
                setState(() {
                  subtaskDone = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
