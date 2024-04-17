import 'package:flutter/material.dart';
import 'package:todos/main.dart';
import 'package:todos/presentation/view/components/custom_appbar.dart';
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
                       const SizedBox(
                  height: 300,
                  child: Center(
                    //TODO: handle recent tasks items
                    child: Text('Handle stats recent tasks items'),
                  ),
                )
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

