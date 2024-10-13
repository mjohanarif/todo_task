import 'package:dartz/dartz.dart';
import 'package:todo_task/module/task/task.dart';
import 'package:todo_task/shared/shared.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource localDataSource;

  TaskRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<TaskModel>>> addTask(TaskModel task) async {
    try {
      final result = await localDataSource.addTask(task);
      return Right(result);
    } on CacheException catch (exception) {
      return Left(CacheFailure(exception.message));
    }
  }

  @override
  Future<Either<Failure, List<TaskModel>>> deleteTask(int index) async {
    try {
      final result = await localDataSource.deleteTask(index);
      return Right(result);
    } on CacheException catch (exception) {
      return Left(CacheFailure(exception.message));
    }
  }

  @override
  Future<Either<Failure, List<TaskModel>>> editTask(
      int index, TaskModel task) async {
    try {
      final result = await localDataSource.editTask(index, task);
      return Right(result);
    } on CacheException catch (exception) {
      return Left(CacheFailure(exception.message));
    }
  }

  @override
  Future<Either<Failure, List<TaskModel>?>> getTasks() async {
    try {
      final result = await localDataSource.getTasks();
      return Right(result);
    } on CacheException catch (exception) {
      return Left(CacheFailure(exception.message));
    }
  }

  @override
  Future<Either<Failure, List<TaskModel>>> filterTask(TaskStatus status) async {
    try {
      final result = await localDataSource.filterTask(status);
      return Right(result);
    } on CacheException catch (exception) {
      return Left(CacheFailure(exception.message));
    }
  }
}
