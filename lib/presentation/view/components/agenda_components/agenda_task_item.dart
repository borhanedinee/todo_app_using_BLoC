import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todos/domain/models/task.dart';
import 'package:todos/main.dart';
import 'package:todos/presentation/view/pages/task_details_screen.dart';

class AgendaTaskItem extends StatelessWidget {
  final double completionPercentage;

 final Task task;

 final Color progressColor;

  const AgendaTaskItem({
    super.key,
    required this.task,
    required this.completionPercentage,
    required this.progressColor
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TaskDetailsScreen(
              completionPercentage: completionPercentage,
              numberOfCompletedSubTasks: 8,
              progressColor: progressColor,
              task: task,
            ),
          ),
        );
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
        height: 80,
        width: size.width,
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
        decoration: BoxDecoration(
          color: Colors.grey.shade800.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // TASK TITILE
                SizedBox(
                  width: size.width * 0.65,
                  child: Text(
                    task.taskTitle!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                // TASK DESCRIPTUON OR SOMETHING ELSE
                Row(
                  children: [
                    Text(
                      task.taskDetails!,
                      style: const TextStyle(color: Colors.white70,fontSize: 12),
                    ),
                    FittedBox(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        margin:
                            const EdgeInsets.only(left: 8, right: 8, bottom: 0),
                        decoration: BoxDecoration(
                          color: switch (task.taskStatus!.toLowerCase()) {
                            'on going' => Colors.blue,
                            'in progress' => Colors.teal,
                            'pending' => Colors.amber,
                            String() => null,
                          },
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            task.taskStatus!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // COMPLETED SUBTAKS
              ],
            ),
            const Spacer(),
            SizedBox(
              child: CircularPercentIndicator(
                progressColor: progressColor,
                radius: 28,
                lineWidth: 6,
                percent: completionPercentage,
                circularStrokeCap: CircularStrokeCap.round,
                curve: Curves.easeOut,
                animation: true,
                animationDuration: 2000,
                center: Text(
                  '${(completionPercentage * 100).toInt()}%',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
