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

  // TODO: HANDLE THE LOADIG THE STATE OF SORTING BY

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeError) {
              // error fetching tasks of logged user
              return Text(
                state.error,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              );
            }
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeLoaded) {
              return SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // APP BAR
                      CustomAppBar(
                        user: prefs.getString('username')!,
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
                                        status: 'Weekly',
                                        numOfTasks: state.weekly,
                                        color: Colors.indigo),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    TaskStatusItem(
                                      icon: Icons.access_time,
                                      status: 'Monthly',
                                      numOfTasks: state.monthly,
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
                                        icon: Icons.pending_actions_outlined,
                                        status: 'Deadlined',
                                        numOfTasks: state.deadlined,
                                        color: Colors.cyan),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    TaskStatusItem(
                                      icon: Icons.done,
                                      status: 'All tasks',
                                      numOfTasks: state.allTasks,
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
                                if (state.recentTaks.isNotEmpty)
                                  InkWell(
                                    onTap: () {
                                      sortDialog(
                                          context,
                                          state.weekly,
                                          state.monthly,
                                          state.deadlined,
                                          state.allTasks);
                                    },
                                    child: Row(
                                      children: [
                                        Text(state.currentSortByStatus),
                                        const Icon(Icons.arrow_drop_down_sharp)
                                      ],
                                    ),
                                  )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          if (state is SortbyLoading)
                            const SizedBox(
                              height: 200,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          state.recentTaks.isEmpty
                              ? Center(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.1,
                                      ),
                                      Image.asset('assets/images/notfound.png',
                                          height: 140),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        'You have no tasks added! \n \nClick on the add button to add \nyour first task.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )
                              : Column(
                                  children: List.generate(
                                    state.recentTaks.length,
                                    (index) {
                                      Task task = state.recentTaks[index];
                                      return RecentTaskItem(
                                          task: task,
                                          completionPercentage: 0.4,
                                          numberOfCompletedSubTasks: 4,
                                          progressColor: Colors.orange);
                                    },
                                  ),
                                ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
            if (state is SortbyLoading) {
              return SizedBox(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // APP BAR
                    CustomAppBar(
                      user: prefs.getString('username')!,
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
                                      status: 'Weekly',
                                      numOfTasks: state.weekly,
                                      color: Colors.indigo),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  TaskStatusItem(
                                    icon: Icons.access_time,
                                    status: 'Monthly',
                                    numOfTasks: state.monthly,
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
                                      icon: Icons.pending_actions_outlined,
                                      status: 'Deadlined',
                                      numOfTasks: state.deadlined,
                                      color: Colors.cyan),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  TaskStatusItem(
                                    icon: Icons.done,
                                    status: 'All tasks',
                                    numOfTasks: state.alltasks,
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
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 200,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Future<dynamic> sortDialog(
      BuildContext context, weekly, monthly, deadlined, alltasks) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.blueGrey,
        content: FittedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'sort by :',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              SortByItem(
                sortBy: 'Category',
                alltasks: alltasks,
                monthly: monthly,
                deadlined: deadlined,
                weekly: weekly,
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              SortByItem(
                sortBy: 'Status',
                alltasks: alltasks,
                monthly: monthly,
                deadlined: deadlined,
                weekly: weekly,
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              SortByItem(
                sortBy: 'Newer',
                alltasks: alltasks,
                monthly: monthly,
                deadlined: deadlined,
                weekly: weekly,
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              SortByItem(
                sortBy: 'Older',
                alltasks: alltasks,
                monthly: monthly,
                deadlined: deadlined,
                weekly: weekly,
              ),
            ],
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

class SortByItem extends StatelessWidget {
  final String sortBy;
  final int weekly;
  final int monthly;
  final int deadlined;
  final int alltasks;

  SortByItem({
    required this.sortBy,
    super.key,
    required this.weekly,
    required this.monthly,
    required this.deadlined,
    required this.alltasks,
  });

  @override
  Widget build(BuildContext context) {
    var homeBloc = BlocProvider.of<HomeBloc>(context);
    return InkWell(
      onTap: () {
        homeBloc.add(SortByChanged(
          sortBy: sortBy,
          alltasks: alltasks,
          weekly: weekly,
          monthly: monthly,
          deadlined: deadlined,
        ));
        Navigator.of(context).pop();
      },
      child: Container(
        width: size.width,
        decoration: const BoxDecoration(),
        child: Text(
          sortBy,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
