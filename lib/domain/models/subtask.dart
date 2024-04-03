class SubTask {
  int? subtaskId;
  String? subtaskTitle;
  int? subtaskTask;
  int? subtaskStatus;

  SubTask(
      {this.subtaskId,
      this.subtaskTitle,
      this.subtaskTask,
      this.subtaskStatus});

  SubTask.fromJson(Map<String, dynamic> json) {
    subtaskId = json['subtask_id'];
    subtaskTitle = json['subtask_title'];
    subtaskTask = json['subtask_task'];
    subtaskStatus = json['subtask_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subtask_id'] = this.subtaskId;
    data['subtask_title'] = this.subtaskTitle;
    data['subtask_task'] = this.subtaskTask;
    data['subtask_status'] = this.subtaskStatus;
    return data;
  }
}