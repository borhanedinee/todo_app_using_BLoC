
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:todos/main.dart';
import 'package:todos/presentation/pallets/app_colors.dart';

class CustomDashboard extends StatelessWidget {
  const CustomDashboard({
    super.key,
    required this.completedTask,
    required this.totalTaks,
  });

  final double completedTask;
  final double totalTaks;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
            const SizedBox(
              height: 10,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}