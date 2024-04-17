import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todos/bloc/homebloc/home_bloc.dart';
import 'package:todos/domain/models/task.dart';
import 'package:todos/presentation/pallets/app_colors.dart';
import 'package:todos/presentation/view/components/agenda_components/agenda_task_item.dart';
import 'package:todos/presentation/view/components/custom_appbar.dart';

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
            DefaultAppBar(title: 'Agenda'),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 30, top: 20),
              child: Text(
                formatDateTime(DateTime.now()),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.normal),
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
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const SizedBox(
                    height: 300,
                    child: Center(
                      child: Text('Loading ...'),
                    ),
                  );
                }
                if (state is HomeLoaded) {
                  return Column(
                    children: List.generate(state.recentTaks.length, (index) {
                      Task task = state.recentTaks[index];
                      return AgendaTaskItem(
                          task: task,
                          completionPercentage: 0.6,
                          progressColor: Colors.blue);
                    }).take(3).toList(),
                  );
                }
                if (state is HomeError) {
                  return SizedBox(
                    height: 300,
                    child: Center(
                      child: Text('Something went wrong \n ${state.error}'),
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
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
