import 'package:todo_task/module/task/domain/entities/task_status.dart';

class Constant {
  static const String imagePlaceholder = 'assets/images/placeholder.jpeg';
  static const String taskKey = 'taskKey';
  static const List<TaskStatus> listStatus = [
    TaskStatus.belumSelesai,
    TaskStatus.selesai,
  ];
}
