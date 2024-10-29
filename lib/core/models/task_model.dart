class TaskModel {
  final String taskTitle;
  final String taskDesc;
  final String taskedDate;
  final bool isCompleted;
  final String tag;
  final int marked;

  TaskModel(
      {required this.taskTitle,
      required this.taskDesc,
      required this.taskedDate,
      required this.isCompleted,
      required this.tag,
      required this.marked});
}
