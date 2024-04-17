import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todos/presentation/pallets/app_colors.dart';

class OverviewByCategory extends StatelessWidget {
  final String cateryLabel;

  const OverviewByCategory({
    super.key,
    required this.cateryLabel,
    required this.completedCategoryTasks,
    required this.totalCategoryTasks,
  });

  final double completedCategoryTasks;
  final double totalCategoryTasks;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: const EdgeInsets.only(left: 10, top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              cateryLabel,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            CircularPercentIndicator(
              animateFromLastPercent: true,
              animation: true,
              animationDuration: 2000,
              curve: Curves.easeIn,
              lineWidth: 5,
              circularStrokeCap: CircularStrokeCap.round,
              radius: 30,
              percent: completedCategoryTasks / totalCategoryTasks,
              center: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: '${completedCategoryTasks.toInt()}',
                    style: const TextStyle(
                      fontFamily: 'Bai Jamjuree',
                      fontSize: 16,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                    text: '/${totalCategoryTasks.toInt()}',
                    style: const TextStyle(
                      fontFamily: 'Bai Jamjuree',
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    )),
              ])),
            )
          ],
        ),
      ),
    );
  }
}
