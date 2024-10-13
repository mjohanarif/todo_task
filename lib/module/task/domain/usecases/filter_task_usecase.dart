import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:todo_task/module/task/domain/domain.dart';
import 'package:todo_task/shared/shared.dart';

class FilterTaskUsecase
    implements UseCaseFuture<Failure, List<TaskModel>, TaskStatus> {
  final TaskRepository repository;

  FilterTaskUsecase({required this.repository});

  @override
  FutureOr<Either<Failure, List<TaskModel>>> call(TaskStatus params) {
    return repository.filterTask(params);
  }
}
