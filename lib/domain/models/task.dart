import 'package:todos/domain/models/subtask.dart';

class Task {
  int? taskId;
  String? taskTitle;
  String? taskDetails;
  String? taskStatus;
  String? taskCategory;
  int? taskUser;
  String? taskDeadline;
  List<SubTask>? subtasks;

  Task(
      {this.taskId,
      this.taskTitle,
      this.taskDetails,
      this.taskStatus,
      this.taskCategory,
      this.taskUser,
      this.taskDeadline,
      this.subtasks});

  Task.fromJson(Map<String, dynamic> json) {
    taskId = json['task_id'];
    taskTitle = json['task_title'];
    taskDetails = json['task_details'];
    taskStatus = json['task_status'];
    taskCategory = json['task_category'];
    taskUser = json['task_user'];
    taskDeadline = json['task_deadline'];
    subtasks = json['subtasks'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <String, dynamic>{};
    // data['task_id'] = this.taskId;
    data['task_title'] = taskTitle.toString();
    data['task_details'] = taskDetails.toString();
    data['task_status'] = taskStatus.toString();
    data['task_category'] = taskCategory.toString();
    data['task_user'] = taskUser.toString();
    data['task_deadline'] = taskDeadline.toString();
    // data['subtasks'] = this.subtasks;
    return data;
  }
}