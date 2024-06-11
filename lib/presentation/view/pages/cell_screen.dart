import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todos/domain/models/task.dart';
import 'package:todos/main.dart';
import 'package:todos/presentation/view/components/custom_appbar.dart';
import 'package:todos/presentation/view/components/home_components/recent_task_item.dart';
import 'package:todos/presentation/view/pages/add_note_screen.dart';

class CellScreen extends StatelessWidget {
  const CellScreen({
    super.key,
    required this.tasks,
    required this.date,
  });

  final List<Task?> tasks;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Icon(
            Icons.add,
            color: Colors.white70,
            size: 30,
          ),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddNoteScreen(),
            ),
          ),
        ),
        body: Container(
          height: size.height,
          child: Center(
            child: tasks.isEmpty
                ? Column(
                    children: [
                      SizedBox(height: size.height*0.25,),

                      Image.asset('assets/images/notfound.png', height: 140),
                      SizedBox(height: 20,),
                      const Text(
                        'No tasks for the selected day!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        DefaultAppBar(
                          title: formatDateTime(date),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 30,
                            left: 10,
                            right: 10,
                          ),
                          child: Text(
                            'Tasks for the selected day :',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ...tasks.map((task) {
                          return RecentTaskItem(
                              task: task!,
                              completionPercentage: 0.4,
                              numberOfCompletedSubTasks: 4,
                              progressColor: Colors.red);
                        }).toList(),
                      ]),
          ),
        ),
      ),
    );
  }

  String formatDateTime(DateTime dateTime) {
    String formattedDate = DateFormat('MMMM dd, yyyy').format(dateTime);
    return formattedDate;
  }
}
