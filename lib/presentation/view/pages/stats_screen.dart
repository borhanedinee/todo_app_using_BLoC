import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:todos/main.dart';
import 'package:todos/pallets/app_colors.dart';
import 'package:todos/presentation/view/components/agenda_components/agenda_task_item.dart';
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.navigate_before,
                        size: 40,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.25,
                  ),
                  const Padding(
                    padding:  EdgeInsets.only(top: 10),
                    child: Center(
                      child: Text(
                        'Stats',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // OVERVIEWWWWWWWWWWWWW
                      FittedBox(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          width: size.width,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade900,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Overview',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'You have completed',
                                      style: TextStyle(
                                        fontFamily: 'Bai Jamjuree',
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20,
                                      ),
                                    ),
                                    TextSpan(children: [
                                      TextSpan(
                                        text: ' 33',
                                        style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Bai Jamjuree'),
                                      ),
                                      TextSpan(
                                        text: '/88 ',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Bai Jamjuree',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ]),
                                    TextSpan(
                                      text: 'of your tasks today.',
                                      style: TextStyle(
                                        fontFamily: 'Bai Jamjuree',
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Text(
                                'Keep it up !',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Bai Jamjuree',
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: LinearPercentIndicator(
                                        width: size.width * 0.7,
                                        lineHeight: 12,
                                        percent: completedTask / totalTaks,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        animationDuration: 2000,
                                        curve: Curves.easeOut,
                                        barRadius: const Radius.circular(50),
                                      ),
                                    ),
                                    Text(
                                      '${((33 / 88) * 100).toInt()}%',
                                      style: const TextStyle(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 26),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
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
