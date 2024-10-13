import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:todo_task/module/task/domain/domain.dart';
import 'package:todo_task/shared/shared.dart';

class EditTaskUsecase
    implements UseCaseFuture<Failure, List<TaskModel>, TaskModel> {
  final TaskRepository repository;

  EditTaskUsecase({required this.repository});

  @override
  FutureOr<Either<Failure, List<TaskModel>>> call(TaskModel params) {
    return repository.editTask(params);
  }
}
