import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todos/bloc/homebloc/home_bloc.dart';
import 'package:todos/domain/models/task.dart';
import 'package:todos/main.dart';
import 'package:todos/presentation/view/pages/edit_screen.dart';
import 'package:todos/presentation/view/pages/task_details_screen.dart';

class RecentTaskItem extends StatelessWidget {
  final double completionPercentage;

  final int numberOfCompletedSubTasks;

  final Color progressColor;

  final Task task;

  const RecentTaskItem(
      {super.key,
      required this.task,
      required this.completionPercentage,
      required this.numberOfCompletedSubTasks,
      required this.progressColor});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return InkWell(
      onLongPress: () {
        print(task.taskTitle);
        longPressDialog(context, homeBloc);
      },
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TaskDetailsScreen(
              completionPercentage: completionPercentage,
              numberOfCompletedSubTasks: numberOfCompletedSubTasks,
              progressColor: progressColor,
              task: task,
            ),
          ),
        );
      },
      child: FittedBox(
        child: Container(
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
          width: size.width,
          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
          decoration: BoxDecoration(
            color: Colors.grey.shade800.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(color: Colors.grey.withOpacity(0.4), width: 0.8),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // TASK TITILE
                  SizedBox(
                    width: size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          task.taskTitle!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                        FittedBox(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            margin: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 0),
                            decoration: BoxDecoration(
                              color: switch (task.taskStatus!.toLowerCase()) {
                                'weekly' => Colors.blue,
                                'monthly' => Colors.teal,
                                'deadlined' => Colors.cyan,
                                String() => null,
                              },
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                task.taskStatus!,
                                style: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // TASK DESCRIPTUON OR SOMETHING ELSE
                  SizedBox(
                    width: size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 140,
                          child: Text(
                            task.taskDetails == ''
                                ? 'No Details'
                                : task.taskDetails!,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          ),
                        ),
                        FittedBox(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            margin: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 0),
                            decoration: BoxDecoration(
                              color: switch (task.taskCategory!.toLowerCase()) {
                                'studying' => Colors.teal,
                                'coding' => Colors.indigo,
                                'self dev' => Colors.amber,
                                'meeting' => Colors.blue,
                                'healthcare' => Colors.red,
                                String() => null,
                              },
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                task.taskCategory!,
                                style: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // COMPLETED SUBTAKS
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // CircleAvatar(
                        //   radius: 8,
                        //   backgroundColor: Colors.yellow.shade200,
                        //   child: const Icon(
                        //     Icons.done_rounded,
                        //     color: Colors.black,
                        //     size: 13,
                        //   ),
                        // ),
                        // const SizedBox(
                        //   width: 5,
                        // ),
                        // Text(
                        //   '$numberOfCompletedSubTasks tasks',
                        //   style: const TextStyle(
                        //     fontWeight: FontWeight.w500,
                        //     fontSize: 12,
                        //     color: Colors.grey,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              // const Spacer(),
              // SizedBox(
              //   child: CircularPercentIndicator(
              //     progressColor: progressColor,
              //     radius: 28,
              //     lineWidth: 6,
              //     percent: completionPercentage,
              //     circularStrokeCap: CircularStrokeCap.round,
              //     curve: Curves.easeOut,
              //     animation: true,
              //     animationDuration: 2000,
              //     center: Text(
              //       '${(completionPercentage * 100).toInt()}%',
              //       style: const TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 12,
              //           color: Colors.grey),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> longPressDialog(BuildContext context, HomeBloc homeBloc) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => EditScreen(
                        task: task,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoaded) {
                    return InkWell(
                      onTap: () {
                        state.recentTaks.removeWhere(
                            (element) => element.taskId == task.taskId);
                        homeBloc.add(
                          DeleteTask(taskId: task.taskId!),
                        );
                      },
                      child: BlocConsumer<HomeBloc, HomeState>(
                        listener: (context, state) {
                          if (state is DeletedTaskState) {
                            if (state.status == 'success') {
                              homeBloc.add(
                                FetchHomeDataEvent(
                                  userId: prefs.getInt('userid')!,
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: const Text('Deleted successfully'),
                                ),
                              );
                              Navigator.of(context).pop();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Something went wrong, please try again'),
                                ),
                              );
                            }
                          }
                        },
                        builder: (context, state) {
                          return const Text(
                            'Delete',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.blueGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
