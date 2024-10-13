import 'package:hive/hive.dart';
import 'package:todo_task/module/task/task.dart';
import 'package:todo_task/shared/shared.dart';

abstract class TaskLocalDataSource {
  Future<List<TaskModel>?> getTasks();
  Future<List<TaskModel>> addTask(TaskModel task);
  Future<List<TaskModel>> editTask(int index, TaskModel task);
  Future<List<TaskModel>> deleteTask(int index);
  Future<List<TaskModel>> filterTask(TaskStatus status);
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  Future<Box<TaskModel>> _getBox() async {
    return Hive.openBox<TaskModel>(Constant.taskKey);
  }

  @override
  Future<List<TaskModel>> addTask(TaskModel task) async {
    try {
      var box = await _getBox();
      await box.add(task);
      var listTask = box.values.toList();
      return listTask;
    } catch (e) {
      throw CacheException(message: "Can't save data");
    }
  }

  @override
  Future<List<TaskModel>> deleteTask(int index) async {
    try {
      var box = await _getBox();
      await box.deleteAt(index);
      var listTask = box.values.toList();
      return listTask;
    } catch (e) {
      throw CacheException(message: "Can't delete task data");
    }
  }

  @override
  Future<List<TaskModel>> editTask(int index, TaskModel task) async {
    try {
      var box = await _getBox();
      await box.putAt(index, task);
      var listTask = box.values.toList();
      return listTask;
    } catch (e) {
      throw CacheException(message: "Can't edit task data");
    }
  }

  @override
  Future<List<TaskModel>?> getTasks() async {
    try {
      var box = await _getBox();
      var result = box.values.toList();
      return result;
    } catch (e) {
      throw CacheException(message: "Can't get task data");
    }
  }

  @override
  Future<List<TaskModel>> filterTask(TaskStatus status) async {
    try {
      var box = await _getBox();
      var result =
          box.values.where((element) => element.status == status).toList();
      return result;
    } catch (e) {
      throw CacheException(message: "Can't get task data");
    }
  }
}
