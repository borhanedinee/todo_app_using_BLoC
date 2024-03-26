import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todos/main.dart';
import 'package:todos/presentation/view/pages/task_details_screen.dart';

class AgendaTaskItem extends StatelessWidget {
  final double completionPercentage;

  final String subTitleTask;

  final String taskTitle;

  final Color progressColor;

  final String status;

  const AgendaTaskItem({
    super.key,
    required this.taskTitle,
    required this.subTitleTask,
    required this.status,
    required this.completionPercentage,
    required this.progressColor,
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
              subTitleTask: subTitleTask,
              taskTitle: taskTitle,
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
          color: Colors.grey.shade900.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.withOpacity(0.4), width: 0.8),
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
                    taskTitle,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                // TASK DESCRIPTUON OR SOMETHING ELSE
                Row(
                  children: [
                    Text(
                      subTitleTask,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    FittedBox(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        margin:
                            const EdgeInsets.only(left: 8, right: 8, bottom: 0),
                        decoration: BoxDecoration(
                          color: switch (status.toLowerCase()) {
                            'on going' => Colors.blue,
                            'in progress' => Colors.teal,
                            'pending' => Colors.amber,
                            String() => null,
                          },
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            status,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
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
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
