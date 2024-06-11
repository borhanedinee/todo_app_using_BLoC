import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todos/bloc/homebloc/home_bloc.dart';
import 'package:todos/domain/models/task.dart';
import 'package:todos/main.dart';
import 'package:todos/presentation/view/pages/edit_screen.dart';
import 'package:todos/presentation/view/root.dart';

class TaskDetailsScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.navigate_before,
                        size: 40,
                      ),
                    ),
                    IconButton(
                      onPressed: () => menuDialog(context,homeBloc),
                      icon: const Icon(
                        Icons.more_vert,
                        size: 40,
                      ),
                    ),
                  ],
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
                          task.taskTitle!,
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          margin: const EdgeInsets.only(
                              left: 20, right: 8, bottom: 20),
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
                        child: Text(
                          task.taskDetails == ''
                              ? 'No task details'
                              : task.taskDetails!,
                          style: const TextStyle(color: Colors.grey),
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
                                          width: 15,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                  text: 'Deadline : '),
                                              TextSpan(
                                                text: task.taskDeadline == ''
                                                    ? 'not deadlined'
                                                    : formatDateTime(
                                                        DateTime.parse(task
                                                            .taskDeadline!)),
                                                style: const TextStyle(
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
                              progressColor: progressColor,
                              radius: 34,
                              lineWidth: 6,
                              percent: completionPercentage,
                              circularStrokeCap: CircularStrokeCap.round,
                              curve: Curves.easeOut,
                              animation: true,
                              animationDuration: 2000,
                              center: Text(
                                '${(completionPercentage * 100).toInt()}%',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
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

  Future<dynamic> menuDialog(BuildContext context, HomeBloc homeBloc) {
    return showDialog(
      
      context: context,
      builder: (context) => AlertDialog(
        alignment: Alignment.topRight,
        content: Container(
          height: 120,
          width: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  print('a weldi  ' + task.taskId.toString());
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
              InkWell(
                onTap: () {
                  homeBloc.add(
                    DeleteTask(taskId: task.taskId!),
                  );
                },
                child: BlocConsumer<HomeBloc, HomeState>(
                  listener: (context, state) {
                    if (state is DeletedTaskState) {
                      if (state.status == 'success') {
                        homeBloc.add(FetchHomeDataEvent(
                            userId: prefs.getInt('userid')!));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: const Text('Deleted successfully'),
                          ),
                        );
                        
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RootScreen(),));
                        
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Something went wrong, please try again'),
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
              ),
              InkWell(
                child: const Text(
                  'Pin',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
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
              value: true,
              onChanged: (value) {},
            )
          ],
        ),
      ),
    );
  }

  String formatDateTime(DateTime dateTime) {
    String formattedDate = DateFormat('dd MMMM').format(dateTime);
    return formattedDate;
  }
}
