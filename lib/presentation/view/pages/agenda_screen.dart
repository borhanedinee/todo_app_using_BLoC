import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todos/data/repositpry/home_repo.dart';
import 'package:todos/domain/models/task.dart';
import 'package:todos/main.dart';
import 'package:todos/presentation/pallets/app_colors.dart';
import 'package:todos/presentation/view/components/custom_appbar.dart';
import 'package:todos/presentation/view/pages/cell_screen.dart';

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({super.key});

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  late EventController _controller;

  HomeRepository homeRepository = HomeRepository();

  List<Task> tasks = [];
  List<CalendarEventData<Object?>> eventsToAdd = [];

  @override
  void initState() {
    super.initState();
    _controller = EventController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: homeRepository.fetchTask(prefs.getInt('userid')),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map data = snapshot.data as Map;

            tasks = data['tasks'];

            eventsToAdd = tasks.map((task) {
              return CalendarEventData(
                  title: task.taskTitle!,
                  date:  DateTime.parse(task.taskDeadline!),
                  endDate: DateTime.tryParse('2024-06-14'),
                  startTime: DateTime(0,0,0,17,00),
                  color: switch (task.taskCategory!.toLowerCase()) {
                    'studying' => Colors.indigo,
                    'coding' => Colors.deepOrange,
                    'self dev' => Colors.green,
                    'others' => Colors.cyan,
                    'meeting' => Colors.yellowAccent,
                    String() => Colors.lightGreen,
                  });
            }).toList();
            _controller.addAll(eventsToAdd);
          }

          return snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: Text('Loading ...'),
                )
              : Container(
                  height: size.height,
                  width: size.width,
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      const DefaultAppBar(title: 'Agenda'),
                      Expanded(
                        child: CalendarView(
                          filteredTasks: tasks,
                          controller: _controller,
                          eventsToAdd: eventsToAdd,
                        ),
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}

class CalendarView extends StatelessWidget {
  const CalendarView({
    super.key,
    required EventController<Object?> controller,
    required this.eventsToAdd,
    required this.filteredTasks,
  }) : _controller = controller;

  final EventController<Object?> _controller;
  final List<CalendarEventData<Object?>> eventsToAdd;
  final List<Task> filteredTasks;

  @override
  Widget build(BuildContext context) {
    return MonthView(
      borderColor: Colors.white,
      useAvailableVerticalSpace: true,

      controller: _controller,
      // to provide custom UI for month cells.
      cellBuilder: (date, events, isToday, isInMonth, hi) {
        // Return your widget to display as month cell.
        return cellItemBuilder(isInMonth, date, events ,isToday);
      },
      borderSize: 0.2,
      minMonth: DateTime(2020),
      maxMonth: DateTime(2050),
      initialMonth: DateTime.now(),
      cellAspectRatio: 1,
      onPageChange: (date, pageIndex) =>
          // ignore: avoid_print
          print("$date, $pageIndex"),
      onCellTap: (events, date) {
        List<Task?> subTasks = [];

        filteredTasks.forEach((task) {
          if (task.taskDeadline!.contains(date.toString().substring(0, 10))) {
            print('true');
            subTasks.add(task);
          } else {
            print('false');
          }
        });

        _controller.addAll(eventsToAdd);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CellScreen(tasks: subTasks , date : date),
          ),
        );
      },
      
      weekDayBuilder: (day) {
        List days = ["M", "T", "W", "T", "F", "S", "S"];
        return SizedBox(
          height: 40,
          child: Text(
            days[day],
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
        );
      },
      startDay: WeekDays.sunday,
      onDateLongPress: (date) => (date) {
        //TODO: IMPLEMENT THIS IF NEEDED
      },
      headerStyle: const HeaderStyle(
        headerTextStyle: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w800,
          fontSize: 20,
        ),
        rightIcon: Icon(
          Icons.navigate_next_rounded,
          size: 30,
          color: Colors.grey,
        ),
        leftIcon: Icon(
          Icons.navigate_before_rounded,
          color: Colors.grey,
          size: 30,
        ),
        decoration: BoxDecoration(),
      ),
      showWeekTileBorder: false,
    );
  }

  Container cellItemBuilder( 
      bool isInMonth, DateTime date, List<CalendarEventData<Object?>> events , bool isToday,) {
      
    return Container(
     decoration: BoxDecoration(
       color: isInMonth ? Colors.black54 : Colors.grey.shade900,
       border: isToday? Border.all(color: Colors.grey.shade400 , width: 3) : null,
     ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(
                cellFormatDateTime(date),
                style: const TextStyle(color: Colors.grey),
              ),
          Column(
            children: [
            
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                height: 60,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...events
                          .map(
                            (e) => Container(
                              decoration: BoxDecoration(
                                  color: e.color,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              margin: const EdgeInsets.only(bottom: 2),
                              child: Text(
                                e.title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                          .toList()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String cellFormatDateTime(DateTime dateTime) {
  String formattedDate = DateFormat('dd').format(dateTime);
  return formattedDate;
}

String formatDateTime(DateTime dateTime) {
  String formattedDate = DateFormat('MMMM , yyyy').format(dateTime);
  return formattedDate;
}
