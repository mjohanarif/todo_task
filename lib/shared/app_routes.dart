import 'package:flutter/material.dart';
import 'package:todo_task/module/task/presentation/ui/pages/task_detail_page.dart';
import 'package:todo_task/module/task/task.dart';

class AppRoutes {
  static const String main = '/';
  static const String addTaskPage = '/add-task-page';
  static const String taskDetailPage = '/task-detail-page';
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return _materialRoute(
          const TaskListPage(),
        );
      case addTaskPage:
        return _materialRoute(
          const AddTaskPage(),
        );
      case taskDetailPage:
        return _materialRoute(
          TaskDetailPage(task: settings.arguments as (int, TaskModel)),
        );

      default:
        return _materialRoute(
          const TaskListPage(),
        );
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => view,
    );
  }
}
