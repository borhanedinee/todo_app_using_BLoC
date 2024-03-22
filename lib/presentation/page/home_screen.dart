import 'package:flutter/material.dart';
import 'package:todos/main.dart';
import 'package:todos/presentation/page/components/custom_app_bar.dart';
import 'package:todos/presentation/page/components/task_status_item.dart';
import 'package:todos/presentation/page/components/recent_task_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // APP BAR
                CustomAppBar(
                  user: 'Borhan',
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TODOS STATUSSSSSSSSSSSSSSSS
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TaskStatusItem(
                                  icon: Icons.refresh_outlined,
                                  status: 'On going',
                                  numOfTasks: 22,
                                  color: Colors.blue),
                              const SizedBox(
                                width: 10,
                              ),
                              TaskStatusItem(
                                icon: Icons.access_time,
                                status: 'In progress',
                                numOfTasks: 4,
                                color: Colors.teal,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TaskStatusItem(
                                  icon: Icons.done,
                                  status: 'Completed',
                                  numOfTasks: 8,
                                  color: Colors.yellow),
                              const SizedBox(
                                width: 10,
                              ),
                              TaskStatusItem(
                                icon: Icons.cancel_outlined,
                                status: 'Canceled',
                                numOfTasks: 3,
                                color: Colors.redAccent,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //RECENT TASKSSSSSSSSSSSSSSS
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Recent Tasks',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RecentTaskItem(
                      taskTitle: 'Completing Ecommerce Project',
                      subTitleTask: 'Project of BRAINY',
                      completionPercentage: 0.3,
                      numberOfCompletedSubTasks: 12,
                    ),
                    RecentTaskItem(
                      taskTitle: 'studying ohoucine shit',
                      subTitleTask: 'PTT',
                      completionPercentage: 0.1,
                      numberOfCompletedSubTasks: 8,
                    ),
                    RecentTaskItem(
                      taskTitle: 'Hamoudi Homework',
                      subTitleTask: 'Ptt',
                      completionPercentage: 0.7,
                      numberOfCompletedSubTasks: 10,
                    ),
                    RecentTaskItem(
                      taskTitle: 'Matering BloC',
                      subTitleTask: 'Flutter',
                      completionPercentage: 0.3,
                      numberOfCompletedSubTasks: 12,
                    ),
                    RecentTaskItem(
                      taskTitle: 'Matering node js',
                      subTitleTask: 'Backend',
                      completionPercentage: 0.3,
                      numberOfCompletedSubTasks: 12,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
