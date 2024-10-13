import 'package:hive/hive.dart';

import 'task_status.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  TaskStatus status;
  @HiveField(3)
  DateTime createdAt;
  @HiveField(4)
  String id;

  TaskModel({
    required this.title,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.id,
  });

  @override
  String toString() {
    return 'title : $title';
  }
}
