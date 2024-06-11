import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:todos/bloc/addtaskbloc/addtask_bloc.dart';
import 'package:todos/bloc/homebloc/home_bloc.dart';
import 'package:todos/domain/models/task.dart';
import 'package:todos/main.dart';
import 'package:todos/presentation/pallets/app_colors.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key, required this.task});

  final Task task;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _formKey = GlobalKey<FormState>();

  var deadlineController = TextEditingController();

  var taskTitleController = TextEditingController();

  var taskDetailsController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    deadlineController.dispose();
    taskTitleController.dispose();
    taskDetailsController.dispose();
  }

  var categories = [
    'Studying',
    'Coding',
    'Self dev',
    '9adya',
    'Meeting',
    'Others'
  ];

  var statusList = [
    'On Going',
    'In Progress',
    'Pending',
  ];

  List<String> selectedDays = [];

  List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  String? selectedCategory;

  String? selectedStatus;

  bool isStatusNotSelected = false;

  bool isCategoryNotSelected = false;

  bool titleValidated = false;

  @override
  void initState() {
    super.initState();
    Task task = widget.task;
    selectedCategory = task.taskCategory!;
    selectedStatus = task.taskStatus!;
    deadlineController.text = task.taskDeadline!;
    taskTitleController.text = task.taskTitle!;
    taskDetailsController.text = task.taskDetails!;
  }

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    final addtaskbloc = BlocProvider.of<AddtaskBloc>(context);
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.navigate_before,
                    size: 40,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                        if (selectedStatus == null) {
                          setState(() {
                            isStatusNotSelected = true;
                          });
                        } else {
                          setState(() {
                            isStatusNotSelected = false;
                          });
                        }
                        if (selectedCategory == null) {
                          isCategoryNotSelected = true;
                        } else {
                          setState(() {
                            isCategoryNotSelected = false;
                          });
                        }
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            titleValidated = true;
                          });
                        } else {
                          setState(() {
                            titleValidated = false;
                          });
                        }

                        if (titleValidated &&
                            !isCategoryNotSelected &&
                            !isStatusNotSelected) {
                          // do your stuff here
                          addtaskbloc.add(
                            UpdatingTaskEvent(
                                task: Task(
                                    taskCategory: selectedCategory,
                                    taskDeadline: deadlineController.text,
                                    taskDetails: taskDetailsController.text,
                                    taskStatus: selectedStatus,
                                    taskTitle: taskTitleController.text,
                                    taskId: widget.task.taskId),
                                selectedDays: selectedDays),
                          );
                        } else {
                          logger.e('things are not validated for submission');
                          logger.i(selectedDays.toString());
                        }
                      },
                  icon: const Icon(
                    Icons.done_rounded,
                    color: AppColors.primaryColor,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 30),
                    child: Text(
                      'New Task',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value == '') {
                                return 'Task title is required';
                              }
                              return null;
                            },
                            controller: taskTitleController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: 'Task title'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: deadlineController,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: 'Deadline ( optional )',
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  DateTime dateTime =
                                      await showOmniDateTimePicker(
                                              context: context) ??
                                          DateTime.now();
                                  setState(
                                    () {
                                      deadlineController.text =
                                          dateTimeToString(dateTime) ?? '';
                                    },
                                  );
                                },
                                icon: const Icon(Icons.keyboard_arrow_down),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 150,
                            alignment: Alignment.topLeft,
                            child: TextField(
                              controller: taskDetailsController,
                              minLines: null,
                              maxLines: null,
                              expands: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  hintText:
                                      'Add your task details ( optional )'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, bottom: 20, top: 15),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Select days ',
                            style: TextStyle(
                                fontFamily: 'Bai Jamjuree',
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 12, right: 20, bottom: 20),
                    child: Wrap(
                      children: daysOfWeek.map((day) {
                        return FittedBox(
                          child: GestureDetector(
                            onTap: () {
                              // Handle category selection here

                              selectedDays.contains(day)
                                  ? selectedDays.remove(day)
                                  : selectedDays.add(day);
                              setState(() {});
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.only(
                                  left: 8, right: 8, bottom: 8),
                              decoration: BoxDecoration(
                                color: selectedDays.contains(day)
                                    ? AppColors.primaryColor.withOpacity(0.8)
                                    : Colors.grey[800],
                                border: selectedDays.contains(day)
                                    ? Border.all(width: 1, color: Colors.white)
                                    : null,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(child: Text(day)),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, bottom: 20, top: 15),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Status ',
                            style: TextStyle(
                                fontFamily: 'Bai Jamjuree',
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                          if (isStatusNotSelected)
                            const TextSpan(
                              text: ' status is required',
                              style: TextStyle(
                                  fontFamily: 'Bai Jamjuree',
                                  color: Colors.red),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 12, right: 20, bottom: 20),
                    child: Wrap(
                      children: statusList.map((status) {
                        return FittedBox(
                          child: GestureDetector(
                            onTap: () {
                              // Handle category selection here
                              setState(() {
                                selectedStatus = status;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.only(
                                  left: 8, right: 8, bottom: 8),
                              decoration: BoxDecoration(
                                color: selectedStatus == status
                                    ? AppColors.primaryColor.withOpacity(0.8)
                                    : switch (status) {
                                        'On Going' => Colors.blue,
                                        'In Progress' => Colors.teal,
                                        'Pending' => Colors.yellow.shade700,
                                        String() => null,
                                      },
                                border: selectedStatus == status
                                    ? Border.all(width: 1, color: Colors.white)
                                    : null,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(child: Text(status)),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Categories ',
                            style: TextStyle(
                                fontFamily: 'Bai Jamjuree',
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                          if (isCategoryNotSelected)
                            const TextSpan(
                              text: ' category is required',
                              style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Bai Jamjuree',
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 12, right: 20, bottom: 20),
                    child: Wrap(
                      children: categories.map((category) {
                        return FittedBox(
                          child: GestureDetector(
                            onTap: () {
                              // Handle category selection here
                              setState(() {
                                selectedCategory = category;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.only(
                                  left: 8, right: 8, bottom: 8),
                              decoration: BoxDecoration(
                                color: selectedCategory == category
                                    ? AppColors.primaryColor.withOpacity(0.8)
                                    : Colors.grey[800],
                                border: selectedCategory == category
                                    ? Border.all(width: 1, color: Colors.white)
                                    : null,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(child: Text(category)),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 30),
                    width: size.width,
                    margin: const EdgeInsets.only(right: 20, left: 20),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (selectedStatus == null) {
                          setState(() {
                            isStatusNotSelected = true;
                          });
                        } else {
                          setState(() {
                            isStatusNotSelected = false;
                          });
                        }
                        if (selectedCategory == null) {
                          isCategoryNotSelected = true;
                        } else {
                          setState(() {
                            isCategoryNotSelected = false;
                          });
                        }
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            titleValidated = true;
                          });
                        } else {
                          setState(() {
                            titleValidated = false;
                          });
                        }

                        if (titleValidated &&
                            !isCategoryNotSelected &&
                            !isStatusNotSelected) {
                          // do your stuff here
                          addtaskbloc.add(
                            UpdatingTaskEvent(
                                task: Task(
                                    taskCategory: selectedCategory,
                                    taskDeadline: deadlineController.text,
                                    taskDetails: taskDetailsController.text,
                                    taskStatus: selectedStatus,
                                    taskTitle: taskTitleController.text,
                                    taskId: widget.task.taskId),
                                selectedDays: selectedDays),
                          );
                        } else {
                          logger.e('things are not validated for submission');
                          logger.i(selectedDays.toString());
                        }
                      },
                      style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 17),
                        ),
                        backgroundColor: const MaterialStatePropertyAll(
                            AppColors.primaryColor),
                        elevation: const MaterialStatePropertyAll(5),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: BlocConsumer<AddtaskBloc, AddtaskState>(
                        listener: (context, state) {
                          if (state is AddTaskError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Something went wrong, please try again'),
                              ),
                            );
                          }
                          if (state is AddTaskSuccess) {
                            homeBloc.add(
                              FetchHomeDataEvent(
                                  userId: prefs.getInt('userid')!),
                            );
                            Navigator.of(context).pop();
                            //TODO: HANDLE NAVIGATION TO HOME PAGE AFTER ADDING TASK
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Edited successfully'),
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is AddTaskLoading) {
                            return const CircularProgressIndicator(
                              color: Colors.white,
                            );
                          } else {
                            return const Text(
                              'Save',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  String? dateTimeToString(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime);
  }
}
