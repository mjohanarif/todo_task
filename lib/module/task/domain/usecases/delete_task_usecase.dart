import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:todo_task/module/task/domain/domain.dart';
import 'package:todo_task/shared/shared.dart';

class DeleteTaskUsecase
    implements UseCaseFuture<Failure, List<TaskModel>, String> {
  final TaskRepository repository;

  DeleteTaskUsecase({required this.repository});

  @override
  FutureOr<Either<Failure, List<TaskModel>>> call(String id) {
    return repository.deleteTask(id);
  }
}
