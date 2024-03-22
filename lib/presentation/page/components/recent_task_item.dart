import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todos/main.dart';

class RecentTaskItem extends StatelessWidget {
  double completionPercentage;

  int numberOfCompletedSubTasks;

  String subTitleTask;

  String taskTitle;

  RecentTaskItem({
    super.key,
    required this.taskTitle,
    required this.subTitleTask,
    required this.completionPercentage,
    required this.numberOfCompletedSubTasks,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      height: 100,
      width: size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white, width: 0.8),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    overflow: TextOverflow.ellipsis
                  ),
                ),
              ),
              // TASK DESCRIPTUON OR SOMETHING ELSE
              Text(
                subTitleTask,
                style: const TextStyle(color: Colors.white70),
              ),
              // COMPLETED SUBTAKS
              Row(
                children: [
                  CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.yellow.shade200,
                      child: const Icon(
                        Icons.done_rounded,
                        color: Colors.black,
                        size: 13,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '$numberOfCompletedSubTasks tasks',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            child: CircularPercentIndicator(
              radius: 28,
              lineWidth: 6,
              percent: completionPercentage,
              circularStrokeCap: CircularStrokeCap.round,
              curve: Curves.easeOut,
              animation: true,
              animationDuration: 2000,
              center:  Text(
                '${(completionPercentage*100).toInt()}%',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
