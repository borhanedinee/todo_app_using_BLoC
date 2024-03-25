import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todos/pallets/app_colors.dart';
import 'package:todos/presentation/view/components/agenda_components/agenda_task_item.dart';

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({super.key});

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  var currentSelectedDate = DateTime.now();
  final List<DateTime> days = [
    DateTime.now(),
    DateTime.now().add(const Duration(days: 1)),
    DateTime.now().add(const Duration(days: 2)),
    DateTime.now().add(const Duration(days: 3)),
    DateTime.now().add(const Duration(days: 4)),
    DateTime.now().add(const Duration(days: 5)),
    DateTime.now().add(const Duration(days: 6)),
    DateTime.now().add(const Duration(days: 7)),
    DateTime.now().add(const Duration(days: 8)),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 20, top: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.navigate_before,
                    size: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 30),
                child: Text(
                  formatDateTime(DateTime.now()),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.normal),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    days.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentSelectedDate = days[index];
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 60,
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: formatDateTime(currentSelectedDate) ==
                                      formatDateTime(days[index])
                                  ? AppColors.primaryColor
                                  : Colors.grey.shade900),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(dayInThreeLetters(days[index])),
                              Text(
                                dayInNumbers(days[index]),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 15, bottom: 20),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Tasks for  ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontFamily: 'Bai Jamjuree',
                        ),
                      ),
                      if (formatDateTime(currentSelectedDate) ==
                          formatDateTime(DateTime.now()))
                        const TextSpan(
                          text: 'Today  ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Bai Jamjuree'),
                        ),
                      TextSpan(
                        text: formatDateTime(currentSelectedDate) ==
                                formatDateTime(DateTime.now())
                            ? '- ${formatDateTime(currentSelectedDate)} -'
                            : formatDateTime(currentSelectedDate),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: formatDateTime(currentSelectedDate) ==
                                    formatDateTime(DateTime.now())
                                ? 16
                                : 20,
                            color: Colors.grey,
                            fontFamily: 'Bai Jamjuree'),
                      )
                    ],
                  ),
                ),
              ),
              const AgendaTaskItem(
                taskTitle: 'Completing Ecommerce Project',
                subTitleTask: 'Project of BRAINY',
                completionPercentage: 0.3,
                progressColor: Colors.redAccent,
              ),
              const AgendaTaskItem(
                taskTitle: 'studying ohoucine shit',
                subTitleTask: 'PTT',
                completionPercentage: 0.9,
                progressColor: Colors.teal,
              ),
              const AgendaTaskItem(
                taskTitle: 'Hamoudi Homework',
                subTitleTask: 'Ptt',
                completionPercentage: 0.7,
                progressColor: Colors.blue,
              ),
            ],
          )),
    );
  }
}

String formatDateTime(DateTime dateTime) {
  String formattedDate = DateFormat('E, dd MMMM yyyy').format(dateTime);
  return formattedDate;
}

String dayInThreeLetters(DateTime dateTime) {
  String formattedDate = DateFormat('E').format(dateTime);
  return formattedDate;
}

String dayInNumbers(DateTime dateTime) {
  String formattedDate = DateFormat('dd').format(dateTime);
  return formattedDate;
}
