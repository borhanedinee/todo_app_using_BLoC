import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/bloc/homebloc/home_bloc.dart';
import 'package:todos/domain/models/task.dart';
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
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeError)
              return Text(
                state.error,
                style: TextStyle(color: Colors.white, fontSize: 30),
              );
            return SizedBox(
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (state is HomeLoading)
                                    const CircularProgressIndicator(),
                                  if (state is HomeLoaded)
                                    TaskStatusItem(
                                        icon: Icons.refresh_outlined,
                                        status: 'On going',
                                        numOfTasks: state.onGoingCount,
                                        color: Colors.blue),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  if (state is HomeLoading)
                                    const CircularProgressIndicator(),
                                  if (state is HomeLoaded)
                                    TaskStatusItem(
                                      icon: Icons.access_time,
                                      status: 'In progress',
                                      numOfTasks: state.inProgressCount,
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
                                  if (state is HomeLoading)
                                    const CircularProgressIndicator(),
                                  if (state is HomeLoaded)
                                    TaskStatusItem(
                                        icon: Icons.pending_actions_outlined,
                                        status: 'Pending',
                                        numOfTasks: state.pendingCount,
                                        color: Colors.yellow),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  if (state is HomeLoading)
                                    const CircularProgressIndicator(),
                                  if (state is HomeLoaded)
                                    TaskStatusItem(
                                      icon: Icons.done,
                                      status: 'Completed',
                                      numOfTasks: state.completedCount,
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
                        if (state is HomeLoading)
                          Container(
                              height: 200,
                              child: const Center(
                                  child: CircularProgressIndicator())),
                        if (state is HomeLoaded)
                          ...List.generate(state.recentTaks.length, (index) {
                            Task task = state.recentTaks[index];
                            return RecentTaskItem(
                                taskTitle: task.taskTitle!,
                                subTitleTask: task.taskDetails!,
                                status: task.taskStatus!,
                                completionPercentage: 0.4,
                                numberOfCompletedSubTasks: 4,
                                progressColor: Colors.orange);
                          })
                      ],
                    )
                  ],
                ),
              ),
            );
          },
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
