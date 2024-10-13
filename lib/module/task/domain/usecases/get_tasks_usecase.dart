import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:todo_task/module/task/domain/domain.dart';
import 'package:todo_task/shared/shared.dart';

class GetTasksUsecase
    implements UseCaseFuture<Failure, List<TaskModel>?, void> {
  final TaskRepository repository;

  GetTasksUsecase({required this.repository});

  @override
  FutureOr<Either<Failure, List<TaskModel>?>> call(void params) {
    return repository.getTasks();
  }
}
