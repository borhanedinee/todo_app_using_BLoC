import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:todos/main.dart';
import 'package:todos/presentation/pallets/app_colors.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  var datePickerController = TextEditingController();

  var taskTitleController = TextEditingController();

  var taskDetailsController = TextEditingController();

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

  String? selectedCategory;
  String? selectedStatus;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.navigate_before,
                  size: 40,
                ),
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
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
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
                              controller: datePickerController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: 'Deadline',
                                suffixIcon: IconButton(
                                  onPressed: () async {
                                    DateTime? dateTime =
                                        await showOmniDateTimePicker(
                                            context: context);
                    
                                    setState(() {
                                      datePickerController.text =
                                          dateTimeToString(dateTime);
                                    });
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
                                minLines: null,
                                maxLines: null,
                                expands: true,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    hintText: 'Add your task details'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 20, top: 15),
                      child: Text(
                        'Status',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
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
                                          'Pending' =>
                                            Colors.yellow.shade700,
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
                    const Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 20),
                      child: Text(
                        'Categories',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
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
                      width: size.width,
                      margin: const EdgeInsets.only(right: 20, left: 20),
                      child: ElevatedButton(
                        onPressed: () {},
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
                        child: const Text(
                          'Create task',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String dateTimeToString(DateTime? dateTime) {
  return DateFormat('dd-MM-yyyy hh:mma').format(dateTime!);
}
