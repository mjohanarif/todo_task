import 'package:dartz/dartz.dart';
import 'package:todo_task/module/task/domain/domain.dart';
import 'package:todo_task/shared/shared.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TaskModel>?>> getTasks();
  Future<Either<Failure, List<TaskModel>>> addTask(TaskModel task);
  Future<Either<Failure, List<TaskModel>>> editTask(int index, TaskModel task);
  Future<Either<Failure, List<TaskModel>>> deleteTask(int index);
  Future<Either<Failure, List<TaskModel>>> filterTask(TaskStatus status);
}
