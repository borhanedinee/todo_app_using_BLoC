import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:todos/main.dart';
import 'package:todos/presentation/pallets/app_colors.dart';
import 'package:todos/presentation/view/components/home_components/custom_app_bar.dart';
import 'package:todos/presentation/view/components/home_components/task_status_item.dart';
import 'package:todos/presentation/view/components/home_components/recent_task_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // APP BAR
                const CustomAppBar(
                  user: 'Borhan',
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TODOS STATUSSSSSSSSSSSSSSSS
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: size.width,
                      child: const Column(
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
                              SizedBox(
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
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TaskStatusItem(
                                  icon: Icons.pending_actions_outlined,
                                  status: 'Pending',
                                  numOfTasks: 8,
                                  color: Colors.yellow),
                              SizedBox(
                                width: 10,
                              ),
                              TaskStatusItem(
                                icon: Icons.done,
                                status: 'Completed',
                                numOfTasks: 3,
                                color: AppColors.primaryColor,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Recent Tasks',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          GestureDetector(
                            onTap: () {
                              showDropDown();
                            },
                            child: const Row(
                              children: [
                                Text('Sort by'),
                                Icon(Icons.arrow_drop_down_sharp)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const RecentTaskItem(
                      status: 'pending',
                      taskTitle: 'Completing Ecommerce Project',
                      subTitleTask: 'Project of BRAINY',
                      completionPercentage: 0.3,
                      numberOfCompletedSubTasks: 12,
                      progressColor: Colors.redAccent,
                    ),
                    const RecentTaskItem(
                      status: 'on going',
                      taskTitle: 'studying ohoucine shit',
                      subTitleTask: 'PTT',
                      completionPercentage: 0.9,
                      numberOfCompletedSubTasks: 8,
                      progressColor: Colors.teal,
                    ),
                    const RecentTaskItem(
                      status: 'in progress',
                      taskTitle: 'Hamoudi Homework',
                      subTitleTask: 'Ptt',
                      completionPercentage: 0.7,
                      numberOfCompletedSubTasks: 10,
                      progressColor: Colors.blue,
                    ),
                    const RecentTaskItem(
                      status: 'pending',
                      taskTitle: 'Matering BloC',
                      subTitleTask: 'Flutter',
                      completionPercentage: 0.3,
                      numberOfCompletedSubTasks: 12,
                      progressColor: Colors.yellow,
                    ),
                    const RecentTaskItem(
                      status: 'on going',
                      taskTitle: 'Matesring node js',
                      subTitleTask: 'Backend',
                      completionPercentage: 0.3,
                      numberOfCompletedSubTasks: 12,
                      progressColor: Colors.redAccent,
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

  DropdownButton2 showDropDown() {
    var categories = [
      'Studying',
      'Coding',
      'Self dev',
      '9adya',
      'Meeting',
      'Others'
    ];
    return DropdownButton2(
      items: categories
          .map((category) => DropdownMenuItem<String>(
                value: category,
                child: Text(
                  category,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
