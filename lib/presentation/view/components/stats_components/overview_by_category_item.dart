
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
    return Container(
      margin: const EdgeInsets.only(left: 10, top: 10),
      padding: const EdgeInsets.only(top: 15, bottom: 30),
      height: 180,
      width: 140,
      decoration: BoxDecoration(
          color: Colors.grey.shade900, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            cateryLabel,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          CircularPercentIndicator(
            animateFromLastPercent: true,
            animation: true,
            animationDuration: 2000,
            curve: Curves.easeIn,
            lineWidth: 8,
            circularStrokeCap: CircularStrokeCap.round,
            radius: 44,
            percent: completedCategoryTasks / totalCategoryTasks,
            center: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: '${completedCategoryTasks.toInt()}',
                  style: const TextStyle(
                    fontFamily: 'Bai Jamjuree',
                    fontSize: 22,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(
                  text: '/${totalCategoryTasks.toInt()}',
                  style: const TextStyle(
                    fontFamily: 'Bai Jamjuree',
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  )),
            ])),
          )
        ],
      ),
    );
  }
}
