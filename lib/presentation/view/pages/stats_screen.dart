import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:todos/main.dart';
import 'package:todos/presentation/pallets/app_colors.dart';
import 'package:todos/presentation/view/components/agenda_components/agenda_task_item.dart';
import 'package:todos/presentation/view/components/custom_appbar.dart';
import 'package:todos/presentation/view/components/home_components/custom_app_bar.dart';
import 'package:todos/presentation/view/components/stats_components/dashboard.dart';
import 'package:todos/presentation/view/components/stats_components/overview_by_category_item.dart';

class StatsScreen extends StatelessWidget {
  final double completedTask = 33;

  final double totalTaks = 88;

  final double codingTasksCompleted = 12;

  final double totalCodingTasks = 30;

  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultAppBar(
                title: 'Status',
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // OVERVIEWWWWWWWWWWWWW
                      CustomDashboard(
                          completedTask: completedTask, totalTaks: totalTaks),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, bottom: 10),
                        child: Text(
                          'Overview by category',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      // EACH CATEGORY WITH PERCENTAGE
                      Flexible(
                        fit: FlexFit.loose,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              OverviewByCategory(
                                  cateryLabel: 'Coding',
                                  completedCategoryTasks: codingTasksCompleted,
                                  totalCategoryTasks: totalCodingTasks),
                              const OverviewByCategory(
                                  cateryLabel: 'Studying',
                                  completedCategoryTasks: 8,
                                  totalCategoryTasks: 10),
                              const OverviewByCategory(
                                  cateryLabel: 'Self dev',
                                  completedCategoryTasks: 4,
                                  totalCategoryTasks: 12),
                              const OverviewByCategory(
                                  cateryLabel: '9adya',
                                  completedCategoryTasks: 5,
                                  totalCategoryTasks: 13),
                              const OverviewByCategory(
                                  cateryLabel: 'Others',
                                  completedCategoryTasks: 3,
                                  totalCategoryTasks: 9)
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
                        child: Text(
                          'Recent Tasks',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const AgendaTaskItem(
                        status: 'In Progress',
                        taskTitle: 'Completing Ecommerce Project',
                        subTitleTask: 'Project of BRAINY',
                        completionPercentage: 0.3,
                        progressColor: Colors.redAccent,
                      ),
                      const AgendaTaskItem(
                        status: 'In Progress',
                        taskTitle: 'studying ohoucine shit',
                        subTitleTask: 'PTT',
                        completionPercentage: 0.9,
                        progressColor: Colors.teal,
                      ),
                      const AgendaTaskItem(
                        status: 'On Going',
                        taskTitle: 'Hamoudi Homework',
                        subTitleTask: 'Ptt',
                        completionPercentage: 0.7,
                        progressColor: Colors.blue,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

