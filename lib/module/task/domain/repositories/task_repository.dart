import 'package:dartz/dartz.dart';
import 'package:todo_task/module/task/domain/domain.dart';
import 'package:todo_task/shared/shared.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TaskModel>?>> getTasks();
  Future<Either<Failure, List<TaskModel>>> addTask(TaskModel task);
  Future<Either<Failure, List<TaskModel>>> editTask(TaskModel task);
  Future<Either<Failure, List<TaskModel>>> deleteTask(String id);
  Future<Either<Failure, List<TaskModel>>> filterTask(TaskStatus status);
}
